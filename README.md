# Web caching rules used at InstantLuxe.com

By simply following best practices and using good open source tools, not necessarily costly services, here is what you could achieve:

![WPT mobile](./images/scoring/wpt-mobile.png "WebPageTest performance summary for the mobile homepage (May 31st, 2018)")

above: [WebPageTest][WPT] performance summary for the mobile homepage (May 31st, 2018)

![WPT desktop](./images/scoring/wpt-desktop.png "WebPageTest performance summary for the desktop homepage (May 31st, 2018)")

above: WebPageTest performance summary for the desktop homepage (May 31st, 2018)

We can reach several thousand users at the same time without a notable slowdown, which is well beyond our usual usage. Since our users are mostly located in France, our servers are there as well and we don’t have much use for a CDN (yet). Likewise, we don’t use serverless or a load balancing system, this is served by a only few dedicated servers with simple roles.

Another view is reported by [PageSpeed Insights][PSI] with [Chrome UX Report][CrUX] (November 12th, 2018):

Mobile:

![WPT desktop](./images/scoring/psi-mobile-score.png "PSI score for mobile (November 12th, 2018)")

![WPT desktop](./images/scoring/psi-mobile-fcp.png "FCP score for mobile (November 12th, 2018)")
![WPT desktop](./images/scoring/psi-mobile-fid.png "FID score for mobile (November 12th, 2018)")

Desktop:

![WPT desktop](./images/scoring/psi-desktop-score.png "PSI score for desktop (November 12th, 2018)")

![WPT desktop](./images/scoring/psi-desktop-fcp.png "FCP score for desktop (November 12th, 2018)")
![WPT desktop](./images/scoring/psi-desktop-fid.png "FID score for desktop (November 12th, 2018)")

What follows can be seen a set of guidelines, tips and tricks that we have used to improve the technical performance of our website. It may or may not apply to anyone else, or have the same results if you do.

Modern image optimisation tutorials on the web tend to use JavaScript as a base tech in their tooling. We have been to use Bash for the most part. To follow along, you will need to be able to install new software on a machine. Since we are talking about web performance, a web server is required as well (examples are provided for both **httpd** and **nginx**).


1. [Guidelines](./chapters/guidelines/README.md)
1. [Front-end](./chapters/front-end/README.md)
1. [Scripts](./chapters/scripts/README.md)


[WPT]: https://www.webpagetest.org/
[PSI]: https://developers.google.com/speed/pagespeed/insights/
[CrUX]: https://developers.google.com/web/tools/chrome-user-experience-report/
