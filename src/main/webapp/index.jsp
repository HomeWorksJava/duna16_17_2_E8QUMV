<%-- 
    Document   : index
    Created on : May 18, 2017, 10:24:44 AM
    Author     : obernay
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pizza Api - The franchise System :-)</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="margin-top:10px">
        <div class="container">
        <jsp:include page="include/navbar.jsp"></jsp:include> 
        <div id="pizzas"></div> 
   </div>
        </div>            
        <script src="styles/bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               $.ajax({
                       type: "GET",
                       url: "http://localhost:8080/pizzaapi/rest/pizza/osszes",
                       data: $("#feltetform").serialize(), 
                       success: function(data)
                       {
                           var appenddiv = document.getElementById("pizzas");
                           for(var x in data)
                           {
                               var maindiv = ce("div");
                                   maindiv.className += " col-sm-4 col-md-3";
                               
                               var paneldiv = ce("div");
                                   paneldiv.className += ("panel panel-primary");
                               
                               var panelheadingdiv = ce("div");
                                   panelheadingdiv.className += ("panel-heading");
                                   
                                   panelheadingdiv.innerHTML = data[x]["nev"];
                                   
                               var thumbnail = ce("div");
                                   thumbnail.className += ("thumbnail");
            
                               var image = ce("img");
                                   image.src = ("http://lorempixel.com/output/food-q-c-200-200-1.jpg");
                                   
                                   thumbnail.appendChild(image);
                                                                      
                                   
                                   
                              var panelbody = ce("div");
                                  panelbody.className += ("panel-body");
                                  
                                   
                                var feltetekp = ce("p");
                                     var feltetekul = ce("ul");
                                     
                                        for(var y in data[x]["feltetek"])
                                        {
                                            var feltetekli = ce("li");
                                         feltetekli.innerHTML = (data[x]["feltetek"][y].feltet);
                                         feltetekul.appendChild(feltetekli);
                                        }
                                        
                                   feltetekp.appendChild(feltetekul);
                                   panelbody.appendChild(feltetekp);
                               
                               var panelfooter = ce("div");
                                   panelfooter.className += ("panel-footer");
                                   
                               var sizep = ce("p");
                                   var sizebutton = ce("span");
                                       sizebutton.className += "btn btn-success";
                                       sizebutton.innerHTML = data[x]["centimeter"] + " CM";
                                   sizep.appendChild(sizebutton);
                                   
                                   panelfooter.appendChild(sizep);
                               
                               var pricep = ce("p");
                                    var pricebutton = ce("span");
                                        pricep.className += "center-block label label-warning";
                                        pricebutton.innerHTML = data[x]["ar"] + " Ft";
                                        
                               pricep.appendChild(pricebutton);
                               panelfooter.appendChild(pricep);
                               
                               
                               paneldiv.appendChild(panelheadingdiv);
                               paneldiv.appendChild(thumbnail);
                               paneldiv.appendChild(panelbody);
                               paneldiv.setAttribute("style", "min-height:500px;");
                               //panelfooter.setAttribute("style","position:relative;bottom:0;")
                               paneldiv.appendChild(panelfooter);
                               maindiv.appendChild(paneldiv);                               
                              appenddiv.appendChild(maindiv); 
                            }
                            
                       }
                     });
            });
            function ce(what)
            {
                return document.createElement(what);
            }
        </script>
        <script src="styles/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
