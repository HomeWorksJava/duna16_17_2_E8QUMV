/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// ez a function egy select id -be tölti be az adott URL-ről jövő json tulajdonságot
        function loadLists(url, id, tulajdonsag){
            console.log("Got url : [" + url + "] Got id: ["+ id +"] Got tulajdonsag: ["+tulajdonsag+"]");
                var xmlHttp = new XMLHttpRequest();
                 xmlHttp.open("GET", url , true);
                 xmlHttp.setRequestHeader("Content-Type","application/json");
                 xmlHttp.responseType = "json";
    
                 xmlHttp.onload = function()
                 {
                  var selectedListx = document.getElementById(id);            
              
                  for(var x in xmlHttp.response)
                  {
                     var option = document.createElement("option");                    
                     option.text = xmlHttp.response[x][tulajdonsag];                                         
                     option.value = xmlHttp.response[x].id;
                     selectedListx.appendChild(option);
                  }
                 };                 
                 xmlHttp.send();
            }
        function loadFeltetek(url, tulajdonsag, tableid)
        {
            var table = document.getElementById(tableid);
              var xmlHttp = new XMLHttpRequest();
                 xmlHttp.open("GET", url , true);
                 xmlHttp.setRequestHeader("Content-Type","application/json");
                 xmlHttp.responseType = "json";
    
                 xmlHttp.onload = function()
                 {                         
              
                  for(var x in xmlHttp.response)
                  {
                        var tr = document.createElement("tr");
                           var td = document.createElement("td");
                           td.innerHTML = xmlHttp.response[x][tulajdonsag];
                           var td2 = document.createElement("td");
                           td2.innerHTML = xmlHttp.response[x].id;
                        tr.appendChild(td2);
                        tr.appendChild(td);                       
                     table.appendChild(tr);                     
                  }
                 };                 
                 xmlHttp.send();            
        }
        
        function loadPizzas(url, tulajdonsag, tableid)
        {
            var table = document.getElementById(tableid);
              var xmlHttp = new XMLHttpRequest();
                 xmlHttp.open("GET", url , true);
                 xmlHttp.setRequestHeader("Content-Type","application/json");
                 xmlHttp.responseType = "json";
    
                 xmlHttp.onload = function()
                 {                         
              
                  for(var x in xmlHttp.response)
                  {
                        var tr = document.createElement("tr");
                           var td = document.createElement("td");
                           td.innerHTML = xmlHttp.response[x][tulajdonsag];
                           var td2 = document.createElement("td");
                           td2.innerHTML = xmlHttp.response[x].id;
                           
                           var td3 = document.createElement("td");
                           for(var y in xmlHttp.response[x].feltetek)
                           {
                              td3.innerHTML += xmlHttp.response[x].feltetek[y].feltet;
                              td3.innerHTML += " ";
                           }
                           var td4 = document.createElement("td");
                           td4.innerHTML = xmlHttp.response[x].centimeter;
                           var td5 = document.createElement("td");
                           td5.innerHTML = xmlHttp.response[x].ar + " Ft";
                           
                           
                        tr.appendChild(td2);
                        tr.appendChild(td);
                        tr.appendChild(td3);
                        tr.appendChild(td4);
                        tr.appendChild(td5);
                     table.appendChild(tr);                     
                  }
                 };                 
                 xmlHttp.send();            
        }
        
        function clearNodeById(id)
        {
            var myNode = document.getElementById(id);
                while (myNode.firstChild) {
                    myNode.removeChild(myNode.firstChild);
                }
        }
        function logout(){
            document.cookie = 'username=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            window.location.replace("login.jsp");
        }