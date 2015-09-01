$(document).ready(function(){
$("#tinderslide").jTinder({
	// dislike callback
    onDislike: function (item) {
	    // set the status text
        $('#status').html('Dislike image ' + (item.index()+1));
    },
	// like callback
    onLike: function (item) {
	    // set the status text
        $('#status').html('Like image ' + (item.index()+1));
    },
	animationRevertSpeed: 200,
	animationSpeed: 400,
	threshold: 1,
	likeSelector: '.like',
	dislikeSelector: '.dislike'
});

	$('#tinderslide > ul li').tinysort({attr: "id"})

	$('.actions .like, .actions .dislike').click(function(e){
		e.preventDefault();
		console.log('as')
		$("#tinderslide").jTinder($(this).attr('class'));
	});
})