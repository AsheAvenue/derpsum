var derpsum = new function() {

    var self = this;

    this.init = function() {
        self.masonry();
        self.bookmarklet();
        self.copyToClipboard();
    };
    
    this.masonry = function() {
        var $container = $('.images');

        $container.isotope({
            itemSelector: '.image',
            animationEngine: 'best-available',
            layoutMode: 'masonry'
        });
    };
    
    this.bookmarklet = function() {
        $('.header-buttons .bookmarklet, .derp-it .x').on('click', function() {
            $('#overlay').toggle();
            $('.derp-it').slideToggle();
        });
    };
    
    this.copyToClipboard = function() {
        
        $('.share').each(function (k,n) {
            $(this).zclip({
                path: '/ZeroClipboard.swf',
                copy: function() { 
                    
                    // First remove the green checkmark from all other share lines
                    $('.share .share-button i').removeClass('green').removeClass('fa-check-circle').addClass('fa-clipboard');
                    
                    // Now get the value to be copied
                    var val = $(this).attr('data-url'); 
                    return val;
                },
                afterCopy: function() { 
                    $(this).find('.share-button i').removeClass('fa-clipboard').addClass('fa-check-circle').addClass('green');
                }
            });
        });
    };
    
};
jQuery(document).ready(function($){
    derpsum.init();
});

$(window).load(function($){
    derpsum.masonry();
});