var derpsum = new function() {

    var self = this;

    this.init = function() {
        self.masonry();
    };
    
    this.masonry = function() {
        var $container = $('.images');

        $container.isotope({
            itemSelector: '.image',
            animationEngine: 'best-available',
            layoutMode: 'masonry'
        });
    };
    
};
jQuery(document).ready(function($){
    derpsum.init();
});

$(window).load(function($){
    derpsum.masonry();
});