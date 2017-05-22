 $(document).ready(function () {
    $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
            $('.table tbody tr').css('display', 'none');
            $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
            $('.table tbody tr').css('display', 'none').fadeIn('slow');
        }
    });

    $('#checkall').on('click', function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("#pizzaform").submit(function(e) {
                var url = "/pizzaapi/rest/pizza/hozzaad";

                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#pizzaform").serialize(), 
                       success: function(data)
                       {
                        if(!data.hasOwnProperty("error"))
                        {
                            if($('#perrormsg').hasClass("label-danger"))
                                $('#perrormsg').removeClass("label-danger").addClass("label-success");
                        
                                   document.getElementById("pizzaform").reset();
                                   loadPizzas("../rest/pizza/osszes", "nev", "pizzak_table");
                        
                        
                            $('#perrormsg').fadeIn(1000).text(data.success).delay(2000).fadeOut(1000);
                        }
                        if(data.hasOwnProperty("error"))
                        {
                            if($('#perrormsg').hasClass("label-success"))
                                $('#perrormsg').removeClass("label-success").addClass("label-danger");
                            $('#perrormsg').fadeIn(1000).text(data.error).delay(2000).fadeOut(1000);
                        }
                       }
                     });

                e.preventDefault();
      });  
    
    
    
    
     $("#feltetform").submit(function(e) {
                var url = "/pizzaapi/rest/feltet/hozzaad";

                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#feltetform").serialize(), 
                       success: function(data)
                       {
                        if(!data.hasOwnProperty("error"))
                        {
                            if($('#errormsg').hasClass("label-danger"))
                                $('#errormsg').removeClass("label-danger").addClass("label-success");
                        
                            $('#errormsg').fadeIn(1000).text(data.success).delay(2000).fadeOut(1000);
                            clearNodeById("feltetek_table");
                            clearNodeById("feltetlistpizzaadd");
                            
                            document.getElementById("feltetform").reset();
                            
                            loadFeltetek("../rest/feltet/osszes","feltet", "feltetek_table");
                            loadLists("../rest/feltet/osszes" , "feltetlistpizzaadd", "feltet");
                        }
                        if(data.hasOwnProperty("error"))
                        {
                            if($('#errormsg').hasClass("label-success"))
                                $('#errormsg').removeClass("label-success").addClass("label-danger");
                            $('#errormsg').fadeIn(1000).text(data.error).delay(2000).fadeOut(1000);
                        }
                       }
                     });

                e.preventDefault();
                });        
});