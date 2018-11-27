# Guidelines

## Rationale

There are many ways to optimise performance. You need a culture of performance, you can’t just apply a few tricks and be done, otherwise you may find someone uploading a video in the middle of a blog piece. You need to keep checking that what you have set up stays in place, and you have to advocate for performance with your team. There are ways to improve performance that only technical people will be able to solve (new compression formats), and there are others that have little to do with technical skills (clean up old campaigns in your Tag Manager of choice).

The one big win is “efficient caching rules”. We are talking about web requests and responses here, and browsers have had caching strategies for years if not decades. We may just as well leverage them. Once you have improved that caching, you have improved navigation for all requests after the first load. Ideally, all your users would load more than one page so this is the biggest low hanging fruit.

Simply put, every asset should be made “immutable” by its unique URL, and new versions of the asset should be reflected by a change in its public URL.

## Examples

The idea is to give every asset its own unchanging URL and to tell the browser to please cache the asset for as long as it can. Asking for a different compression format or image codec won't affect the URL, because essentially you are still asking for the same content and what you already downloaded is good enough. What changes between these requests is the context, usually in the form of HTTP headers like `Accept`.

Request InstantLuxe’s logo without context (the most widely supported format):

```sh
$ curl -I "https://assets.instantluxe.com/images/logo/instantluxe.png"
HTTP/2 200
server: nginx
date: Tue, 12 Jun 2018 08:32:04 GMT
content-type: image/png
content-length: 5043
last-modified: Thu, 04 May 2017 14:59:45 GMT
etag: "590b41e1-13b3"
expires: Thu, 31 Dec 2037 23:55:55 GMT
cache-control: max-age=315360000
link: <https://assets.instantluxe.com/images/logo/instantluxe.png>; rel="canonical"
vary: Accept, CH-DPR
cache-control: no-transform, public, immutable
accept-ranges: bytes
```

Request the logo with a browser that supports the WebP image format:
```sh
$ curl -H "Accept: image/webp" -I "https://assets.instantluxe.com/images/logo/instantluxe.png"
HTTP/2 200
server: nginx
date: Tue, 12 Jun 2018 08:32:21 GMT
content-type: image/webp
content-length: 4222
last-modified: Thu, 04 May 2017 14:59:45 GMT
etag: "590b41e1-107e"
expires: Thu, 31 Dec 2037 23:55:55 GMT
cache-control: max-age=315360000
link: <https://assets.instantluxe.com/images/logo/instantluxe.png>; rel="canonical"
vary: Accept, CH-DPR
cache-control: no-transform, public, immutable
accept-ranges: bytes
```

Another structuring guideline with assets (not necessarily with dynamic documents) is to try our best to serve the content, even if with different parameters, so long as it is essentially the same. For example if you request the same logo with a format that does not exist, say `Accept: image/xyz`, you get the default format instead (not an error, because those tend to be HTML documents). The idea is that our images are intended for use in an HTML `<img>` tag, where browsers don’t much care that the HTTP request header matches the URL or the actual codec used for the image. So long as the resource can be presented as an image, it will work. Later in this document, we will get to the server config to achieve this easily. It works with stricter APIs too, because the HTTP response includes the content type of the file that the server shipped.

Now let’s say you browse the website and the browser caches a bunch of assets. Say one of these happens to be a non-optimised version, because you were browsing while the optimisations were taking place. Your browser may spend a little bit more time downloading the full size version of this asset, but now it has cached it with a long lifetime like any other asset. Later, when the optimised version of that asset is available to the rest of the world and you continue your browsing, your browser won’t even ask for the download because that would waste even more bandwidth. Your locally cached version is already good enough, but if your browser did make the request, it would get the optimised asset.

However, whenever we update an asset on disk, we change its version number in our system so the HTML references a new URL (_ie._ instantluxe.1.png, instantluxe.2.png, instantluxe.3.png _etc._). This way, browsers’ caching strategies discover a new URL, are unable to find a local match and they need to fetch the asset again. The old version of the asset will never be used again, so eventually its “last used” timestamp in the browser’s caching system will become stale and the browser will prune old entries.

## Images

With images making up the most of the content downloaded from any modern web page (except audio and video, but let’s not go there), they are going to be our primary focus in this writeup.

The best way we have found to optimise images is to re-encode them in several alternate formats (WebP, JP2, JXR…), and also keep a re-encoded copy in their own format (metadata strip, better compression…). Each image file is made available in several formats so that when the web browser requests its preferred format, the server is able to match against simple content negotiation rules to ship the best file.

The alternate formats have a narrower browser support than the standard JPEG/PNG/GIF: they are WebP (Chromium-based), JPEG-2000 (Safari) and JPEG-XR (IE, Edge). Each of our images is passed through scripts that try to re-encode their thumbnails to each of these formats, and keep only versions when the file is smaller than for the standard format.

For instance, the logo from our parent company is a 8.6 Kio PNG file with a 6.4 Kio JP2 and a 3.1 Kio WebP variants. However, our own logo is a 8.7 Kio PNG file with a 7.3 Kio WebP variant and no JP2 variant.

Whenever that makes sense, we use SVG files instead of actual image files. For instance, the logos for our rental classification (black, gold, silver and ultra) weigh around 1 Kio for the source SVG, but around 470 Kio when Gzipped and usually less than 400 Kio with Brotli.

For more details on image optimisation techniques, you can look up [Addy Osmani’s eBook][addy's image guide] and [Ilya Grigorik’s guide][ilya's image guide].

Images are served depending on browser support and expected gains. In order, we will prioritize WebP first, then JP2/JXR and finally JPEG/PNG, with fallbacks to the non-optimised thumbnail and finally the full-size image.

## Other static assets

After images, the next biggest chunk of data sent down the wire are static assets (mostly CSS and JavaScript files but also fonts).

Any file can be compressed using various technologies with variable file size gains and browser support. There are even people who advocate for gzipped images on top of better compression, but it is most effective with text-based files and with fonts.

In the case of CSS and JS files, they are also minified and post-processed before they are compressed. This gives us an opportunity to optimise their rules, maybe fix some compatibility issues or rewrite some parts in a way best suited for computers (as opposed to the humans who wrote them).

When we ship a new release, we compress each asset with simple GZIP at first, and then we replace this file with a better Zopfli encoding. We also compress with LZMA and Brotli.

![release timeline](../../images/release-timeline.png "Availability of asset compression formats with regards to the release process")

For example, our own JS file is 223 Kio; minified, it becomes 139 Kio or 57 Kio once it is Gzipped; the final Zopfli file is 38 Kio while the LZMA is 33 Kio and the Brotli version is 31 Kio.

As we will see later, even some of our pages are “static assets” as far as the web server is concerned.

Static assets are served depending on browser support and expected gains. In order, we will prioritize Brotli first, then LZMA (although it has since been phased out since Safari started supporting Brotli) and finally Zopfli/GZIP, with fallbacks to the uncompressed minified file and finally the source file.


1. **[Guidelines](./chapters/guidelines/README.md)** (end of this chapter)
1. [Front-end](./chapters/front-end/README.md)
1. [Scripts](./chapters/scripts/README.md)


[addy's image guide]: https://images.guide/
[ilya's image guide]: https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/image-optimization
