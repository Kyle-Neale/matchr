$(document).ready(function() {

    $('.spinner').hide();
    $("#tinderslide").jTinder({
        // dislike callback
        onDislike: function(item) {
            // set the status text
            $('#status').html('Dislike image ' + (item.index() + 1));
        },
        // like callback
        onLike: function(item) {
            // set the status text
            var myId = $("#tinderslide > ul li").last().attr("id")
            $("#user_" + myId)[0].click();

        },
        animationRevertSpeed: 200,
        animationSpeed: 400,
        threshold: 1,
        likeSelector: '.like',
        dislikeSelector: '.dislike'
    });
    if (($('#tinderslide').length) && ($('#tinderslide > ul li').length)) {


        $('#tinderslide > ul li').tinysort({
            attr: "id"
        })

        $('.actions .like, .actions .dislike').click(function(e) {
            e.preventDefault();
            $("#tinderslide").jTinder($(this).attr('class'));
        });
    }
})
