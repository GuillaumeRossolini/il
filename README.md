This repository is a collection of tips that were used at a previous job (InstantLuxe.com which was shut down Dec 31st, 2018), in order to improve the loading time of the web pages, most notably in relation to asset optimization and brower caching rules.

Feel free to adapt any of this for your website, and don't hesitate to let me know if you do. Possible improvements are welcome _via_ issues or pull requests.

The whole article is also available as a [PDF here](./Guillaume_Rossolini_-_How_we_improved_the_performance_of_our_website.pdf
).

Let's begin:



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


1. [Guidelines](./1-GUIDELINES.md)
1. [Front-end](./2-FRONTEND.md)
1. [Scripts](./3-SCRIPTS.md)


[WPT]: https://www.webpagetest.org/
[PSI]: https://developers.google.com/speed/pagespeed/insights/
[CrUX]: https://developers.google.com/web/tools/chrome-user-experience-report/
