<%-- 
    Document   : index
    Created on : May 18, 2017, 12:42:44 PM
    Author     : obernay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAPI - Admin</title>
        <script>
            if(document.cookie.indexOf('username=') === -1 ){window.location.replace("login.jsp");}          
        </script>
        <link href="../styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .tab-pane{margin-top: 45px;}
        </style>
    </head>
    <body>
        <div class="container">
        <jsp:include page="include/navbar.jsp" />
        <div class="jumbotron">
        <h1>Hello, <script> document.write(document.cookie.split("username=")[1].split(";")[0]); </script> !</h1>
        </div>
        </div>
        

        
<div class="container">
   <div>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#rendelesek" aria-controls="rendelesek" role="tab" data-toggle="tab">Rendelések </a></li>
    <li role="presentation"><a href="#pizzak" aria-controls="pizzak" role="tab" data-toggle="tab"> Pizzák </a></li>
    <li role="presentation"><a href="#feltetek" aria-controls="feltetek" role="tab" data-toggle="tab"> Feltétek </a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="rendelesek">  
        
     </div>
    <div role="tabpanel" class="tab-pane" id="pizzak"> 
    
        <div class="panel panel-primary">
            <div class="panel-heading">Pizza hozzáadás <span id="perrormsg" class="pull-right label label-danger"></span></div>
            <div class="panel-body">
                <form id="pizzaform" action="../rest/pizza/hozzaad" method="post">

                    <div class="form-group col-md-2">
                        <select class="form-control" id="feltetlistpizzaadd" name="feltet" multiple></select>
                    </div>                    
                    <div class="form-group col-md-4">
                        <input class="form-control" name="pizzanev" placeholder="név" type="text">
                    </div>                    
                    <div class="form-group col-md-4">
                        <input class="form-control" name="pizzameret" placeholder="méret" type="text">    
                    </div>
                    <div class="form-group col-md-4">
                        <input class="form-control" name="pizzaar" placeholder="ár" type="text">    
                    </div>
                   <button class="btn btn-success" type="submit">Hozzáadás</button>
                </form>
            </div>          
        </div>
            
      <div class="col-md-10 col-md-offset-1"  >
        <table class="table table-condensed">
                <thead>
                 <th>ID</th>
                 <th>Pizza neve</th>
                 <th>Feltétek</th>
                 <th>Méret</th>
                 <th>Ár</th>
                </thead>
                <tbody id="pizzak_table">                    
                </tbody>
            </table>
            </div>
    
    </div>
    <div role="tabpanel" class="tab-pane" id="feltetek"> 
    
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-primary">
                <div class="panel-heading">Feltét hozzáadása <span id="errormsg" class="pull-right label label-danger"></span></div>
                <form id="feltetform">
                <div class="panel-body">
                    <div class="form-group">
                        <label for="addFeltet">Feltét megnevezése </label>
                        <input id="addFeltet" class="form-control" type="text" name="feltet"> 
                    </div>
                </div>
                <div class="panel-footer"><button class="btn btn-sm btn-block btn-primary" >Hozzáadás</button></div>
                </form>
            </div>
        </div>
        
        <div class="col-md-10 col-md-offset-1"  >
        <table class="table table-condensed">
                <thead>
                 <th>ID</th>
                 <th>Feltét</th>
                
                </thead>
                <tbody id="feltetek_table">                    
                </tbody>
            </table>
            </div>
    
    </div>
  </div>

</div>
   
</div>
        
        <script src="../styles/bootstrap/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../styles/async.js" type="text/javascript"></script>
        <script> loadFeltetek("../rest/feltet/osszes","feltet", "feltetek_table"); </script>
        <script> loadPizzas("../rest/pizza/osszes", "nev", "pizzak_table");</script>
        <script> loadLists("../rest/feltet/osszes" , "feltetlistpizzaadd", "feltet"); </script>
        <script src="../styles/customjqueries.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
