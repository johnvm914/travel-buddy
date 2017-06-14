$(document).ready(function() {
    'use strict';
    // Google Analytics: change UA-XXXXX-X to be your site's ID.
    (function (b, o, i, l, e, r) {
        b.GoogleAnalyticsObject = l;
        b[l] || (b[l] =
                function () {
                    (b[l].q = b[l].q || []).push(arguments)
                });
        b[l].l = +new Date;
        e = o.createElement(i);
        r = o.getElementsByTagName(i)[0];
        e.src = 'https://www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e, r)
    }(window, document, 'script', 'ga'));
    ga('create', 'UA-XXXXX-X');
    ga('send', 'pageview');

    // menu responsive use slicknav
    $('#menu').slicknav({
        label: '',
    });

    $('.slicknav_menu >a').on('click', function() {
        $(this).toggleClass('koi-close-menu');
        $('.slicknav_menu .slicknav_nav').toggleClass('show-menu');
        $('#tsp_bg_mobile').toggleClass('koi-bg-show-menu');
    });

    // Add carousel js.
    $('.tsp-owl-carousel').each(function() {
        var item_lg = $(this).data('item-lg');
        var item_md = $(this).data('item-md');
        var item_sm = $(this).data('item-sm');
        if (item_lg || item_md) {
            $(this).owlCarousel({
                loop: true,
                margin: 30,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    400: {
                        items: item_sm
                    },
                    600: {
                        items: item_md
                    },
                    1000: {
                        items: item_lg
                    }
                }
            });
        }
    });

    // NAV hotel detail
    $('.tsp-nav-hotel-detail ul li a').on('click', function( e ) {
        e.preventDefault();
        $('.tsp-nav-hotel-detail ul li a').removeClass('active');
        $(this).addClass('active');
        $('body, html').animate({ 
          scrollTop: $( $(this).attr('href') ).offset().top 
        }, 600);
    });
    //date picker
    $('.tsp-date').datepicker({
        //format: 'dd.mm.yyyy',
    });
});