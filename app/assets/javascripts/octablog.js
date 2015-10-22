$(function() {
    $("#search input").keyup(function() {
        $.get($("#posts").attr("action"), $("#search input").serialize(), function( data ) {
            $("#posts").html("");
            for	(index = 0; index < data.length; index++) {
                var post = [];
                post.push("<li class='list-group-item list-group-item-info'>");
                post.push("<a data-remote='true' href='http://localhost:3000/posts/" + data[index].id + "'>" + data[index].name + "</a>");
                post.push("<span class='edit'>");
                post.push("<a data-remote='true' href='/posts/" + data[index].id + "/edit'><button class='btn btn-primary btn-xs'>Edit</button>");
                post.push("</a>");
                post.push("<a data-confirm='Are you sure?' data-method='delete' data-remote='true' href='/posts/" + data[index].id + "' rel='nofollow'><button class='btn btn-danger btn-xs'>Delete!</button>");
                post.push("</a>");
                post.push("</span>");
                post.push("</li>");
                $("#posts").append(post.join(""));
            }
        }, "json");
    });
});