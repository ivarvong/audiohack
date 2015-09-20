jQuery(document).ready(function() {
	console.log('sup')
    jQuery('#openmenu').click(function(e) {
        jQuery('#pagewrapper').toggleClass('opennav');
        jQuery('#leftnav').toggleClass('active');
 
        e.preventDefault();
    });
});