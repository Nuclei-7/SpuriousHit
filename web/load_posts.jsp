<%-- 
    Document   : load_posts
    Created on : 02-Apr-2024, 9:52:53 am
    Author     : Mr Kalwar
--%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">
    
    <% 
        // Checking if the user is logged in
        User user = (User)session.getAttribute("currentUser");
        if(user == null){
            response.sendRedirect("loginPage.jsp");
        }
        
        // Retrieving posts based on category ID
        PostDao d = new PostDao(ConnectionProvider.getConnection());       
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        
        if(cid == 0){
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        // Handling case when no posts are available
        if(posts.size() == 0){
            out.println("No Posts in this Category...");
            return;
        }
        
        // Iterating over each post to display
        for(Post p : posts) {
    %>
    
    <div class="col-md-6 mt-2 ">
        <div class="card">
           <img class="card-img-top" src="blog_pic/<%= p.getpPic() %> " alt="Card image cap">              
                <div class="card-body">
                    <b><%= p.getpTitle() %></b>
                                  
                    <% 
                        // Initializing LikeDao object to handle likes for each post
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    %>
            </div>
            <div class="card-footer primary-background text-center">            
                <a href="#!" onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>)"  class="btn btn-outline-light btn-sm "><i class="fa-solid fa-thumbs-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
                <!-- Link to view full post -->
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>                           
                <!-- Placeholder for comments count, currently static -->
                <a href="#!" class="btn btn-outline-light btn-sm "><i class="fa-regular fa-comment"></i><span></span></a>
                    
            </div>  
        </div>
    </div>           
            
    <% 
        }
    %>
</div>

<script>
    // JavaScript function to handle like functionality
    function doLike(pid, uid) {
        console.log(pid + "," + uid);

        const d = {
            uid: uid,
            pid: pid,
            operation: 'like'
        };
        $.ajax({
            url: "LikeServlet",
            data: d,
            success: function(data, textStatus, jqXHR) {
                console.log(data);
                
                // Incrementing like counter on successful like
                if(true){
                    let c = $(".like-counter").html();
                    c++;
                    $('.like-counter').html(c);
                    console.log(c);
                }
                
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    }  
</script>
  
    
      
    
