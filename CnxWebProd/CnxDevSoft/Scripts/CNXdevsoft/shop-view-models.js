var basketModel = null;
var basketInit = false;

function PriceModel(dataText, key) {
    var self = this;
    key = key + " .listOfPrice";
    self.dataText = dataText;
    self.Prices = $.map($(key), function (e) {
        var price = $(e).attr("value").split('_');
        return parseInt(price[0]);
    });
}


function MagazinePageViewModel(data, baseUrl, superBasketUrl) {
    var self = this;
    if (basketInit == false) 
    {
        ko.utils.extend(self, data);
    }
        // bind the vm to self
    self.BaseUrl = baseUrl;
    self.Myfunction = function (data, event) {      
        var dataValue = event.target.id;
        var amount = event.target.value;
        var splitId = dataValue.split('_');
        var productId = "Product_" + splitId[1];
        var ConcatproductId = "#" + productId + " " + ".listOfPrice";  
        var bestPrice = "0";


        var priceItemReal = 0;
        var amountItemReal = 1;
        $(ConcatproductId).each(function () {
            price = $(this).attr("value").replace('#', '').split('_');
            var priceItem = price[1].replace(',', '.').replace(' ', '');
            var minAmount = parseInt(price[0]);

            if (amount >= minAmount) {

                /* bestPrice = priceItem * amount;*/

                priceItemReal = price[1];
                amountItemReal = amount;
            }
        });

        /*$(ConcatproductId).each(function () {
            var price = $(this).attr("value").replace('#', '').split('_');
            var priceItem = price[1].replace(',', '.').replace(' ', '');
            var minAmount = parseInt(price[0]);
            if (amount >= minAmount) {
                bestPrice = priceItem;
            }
        });*/

        var request = new PriceModel(amountItemReal + "_" + priceItemReal, "#" + productId);
        $.ajax({
            url: "/Umbraco/surface/ProductSurface/PriceInfo",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(request),
            success: function (data) {
                var dynamicUpdate = "#dynamicValue_" + splitId[1];
                $(dynamicUpdate).text(data.TotalPrice);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /* alert("error: " + errorThrown);*/
            }
        });


       /* $.ajax({
            url: "/Umbraco/surface/ProductSurface/ConvertPriceToCurrency",
            type: 'post',
            data: {
                price: bestPrice
            },
            success: function (data) {
                var dynamicUpdate = "#dynamicValue_" + splitId[1];
                $(dynamicUpdate).text(data.newBestPrice);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });*/
    }  
    self.AddMagazineProductToBasket = function (form) {
        basketModel.AddMagazineProductToBasket(form);      
    };   
}

function BasketViewModel(viewModel, baseUrl, superBasketUrl) {

    

   



    var self = this;
    basketModel = self;

    if (basketModel == null) {
        $("#CartOnRightSide").hide(3000);
    }
    else {
        $("#CartOnRightSide").fadeIn(3000);
    }


    // bind the vm to self
    ko.utils.extend(self, viewModel);
    self.BaseUrl = baseUrl;
    self.SuperBasketUrl = superBasketUrl;
 
    self.Product = ko.observable(viewModel.Product);

    self.AddProductToBasket = function (form) {        
        
        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form.Amount.value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
            redirectCurrentPage: form.redirectCurrentPage.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {              
                if (data.Error == null) {
                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".addToCartButton");
                    ko.mapping.fromJS(data, self);                   
                    
                }
                else
                {
                    $(".savingBasket_" + form.productId.value).hide();                   
                    $(".addToCartButton").show();                   
                    alert(data.Error);
                }               
            },
            error: function (data) {
             
            }
        });

    }.bind(self);

    self.RemoveProductFromBasket = function (form) {
        var obj = {
            basketProductId: parseInt(form.basketProductId.value),
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/RemoveProductFromBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                ko.mapping.fromJS(data, self);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });

    }.bind(self);

    self.RemoveAllProductFromBasket = function (form) {
        
        var obj = {
            culture: form.culture.value
        };

        bootbox.dialogHpSchou({
            message: form.alertText.value + "?",
            buttons: {
                Cancel: {
                    label: form.cancel.value,
                    className: "btn-default cancelButton",
                    callback: function () {                      
                    }
                },
                OK:
                    {
                        label: form.remove.value,
                        className: "btn-primary allRemoveButton",
                        callback: function () {
                            $.ajax({
                                url: "/Umbraco/surface/Basket/RemoveAllProductFromBasketByIdAsJson",
                                type: 'POST',
                                dataType: 'json',
                                contentType: "application/json",
                                data: JSON.stringify(obj),
                                success: function (data) {
                                    ko.mapping.fromJS(data, self);
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("error: " + errorThrown);
                                }
                            });
                        }
                    }
            }
        });

   /*     bootbox.confirm(form.AlertText.value + "?", function (result) {

           


            if (result == true) {                          
                $.ajax({
                    url: "/Umbraco/surface/Basket/RemoveAllProductFromBasketByIdAsJson",
                    type: 'POST',
                    dataType: 'json',                    
                    contentType: "application/json",
                    data: JSON.stringify(obj),
                    success: function (data) {
                        ko.mapping.fromJS(data, self);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("error: " + errorThrown);
                    }
                });

            }
           


        });*/

       




    }.bind(self);

    basketInit = true;
  
    self.AddRelateProductToBasket = function (form) {
   
        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form[6].value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
            redirectCurrentPage: form.redirectCurrentPage.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);


                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".relateButton_" + form.productId.value);
                  /*  $(".savingBasket_" + form.productId.value).fadeOut(2000
                       , function () {
                           $(".relateButton_" + form.productId.value).fadeIn(3000);
                       });*/
                }
                else
                {
                    $(".savingBasket_" + form.productId.value).hide();
                    $(".relateButton_" + form.productId.value).show();
                    alert(data.Error);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });
    }.bind(self);

    self.AddSearchResultProductToBasket = function (form) {

        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form[5].value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
            redirectCurrentPage: form.redirectCurrentPage.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);
                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".searchResultButton_" + form.productId.value);
                }
                else {
                    $(".savingBasket_" + form.productId.value).hide();
                    $(".relateButton_" + form.productId.value).show();
                    alert(data.Error);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });
    }.bind(self);

    self.AddSuperBasketProductToBasket = function (form) {
       /* $(".addToCartButton").hide();
        $(".savingBasket_" + form.superBasketId.value).fadeIn(2000);*/
        var obj = {
            superBasketId: parseInt(form.superBasketId.value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddSuperBasketProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                ko.mapping.fromJS(data, self);
                controlImageThemeBeforeAddProduct(".savingBasket_" + form.superBasketId.value, ".addToCartButton");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });                  
    }.bind(self);  

    self.AddProductToBasketByNumber = function (form) {

        //$("#quickOrderButton").hide();
        //$(".savingBasketQuickOrder").fadeIn(2000);


        var obj = {
            number: parseInt(form.quickOrderNumber.value),
            amount: parseInt(form.quickOrderAmount.value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
         
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByNumberAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                ko.mapping.fromJS(data, self);
                if (data.Error != null) {
                    bootbox.alert(data.Error);
                } else {
                    controlImageThemeBeforeAddProduct(".savingBasketQuickOrder", "#quickOrderButton");
                    $("#quickOrderNumber,#quickOrderAmount").val("");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            },
        });
    }.bind(self);

    self.AddMagazineProductToBasket = function (form) {
        /*   $(".productButton_" + form.productId.value).hide();
           $(".savingBasket_" + form.productId.value).fadeIn(2000);   */   
        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form[4].value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {

                if (data.Error == null) {
                ko.mapping.fromJS(data, self);         

                controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".productButton_" + form.productId.value);
                }
                else {
                    $(".savingBasket_" + form.productId.value).hide();
                    $(".productButton_" + form.productId.value).show();
                    alert(data.Error);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });
    }.bind(self);
   


    self.AddProductOnSlideShowToBasket = function (form) {
    
     
     /*   $(".addToCartButton_" + form.productId.value).hide();
        $(".savingBasket_" + form.productId.value).fadeIn(3000);*/
        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            Amount: parseInt(form[4].value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);
                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".addToCartButton_" + form.productId.value);
                }
                else {
                    $(".savingBasket_" + form.productId.value).hide();
                    $(".addToCartButton_" + form.productId.value).show();
                    alert(data.Error);
                }
            },
            error: function (data) {

            }
        });

       
    }.bind(self);

    self.ChangeAmountOfProductInCheckout = function (data, event) {
        var dataId = event.target.id;
        var dataValue = event.target.value
        if(dataValue <= 0) { dataValue = 1; }
        var splitId = dataId.split('_');
        var obj = {
            productId: parseInt(splitId[1]),
            classId: parseInt(splitId[2]),
            amount:  parseInt(dataValue),
            sumIfExists: false,
            culture: $("#Culture").val(),
            
        };
        setInterval(5000);
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);
                    $('#CartOnHeader').on('shown.bs.dropdown', function () {
                        $("#Cart-Dropdown").css("display", "block");
                   
                    })
                }
                else {
                    alert(data.Error);
                }
            },
            error: function (data) {

            }
        });       
      
    }.bind(self);


    self.RemoveSuperBaskerFromBasket = function (form) {
        var obj = {
            basketProductId: parseInt(form.productId.value),
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/RemoveSuperBaskerFromBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                ko.mapping.fromJS(data, self);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });

    }.bind(self);



    self.AddBasketHistoryProductToBasket = function (form) {
       /* $(".addBasketHistoryToCartButton_" + form.basketId.value).hide();
        $(".savingBasket_" + form.basketId.value).fadeIn(2000);*/
        var obj = {
            BasketId: parseInt(form.basketId.value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddBasketHistoryProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                ko.mapping.fromJS(data, self);

              /*  $(".savingBasket_" + form.basketId.value).fadeOut(2000
                    , function () {
                        $(".addBasketHistoryToCartButton_" + form.basketId.value).fadeIn(3000);
                    });*/

                controlImageThemeBeforeAddProduct(".savingBasket_" + form.basketId.value, ".addBasketHistoryToCartButton_" + form.basketId.value)
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });
    }.bind(self);

   
    renderedHandler = function (elem) {
        
    }
 
    self.ChangePriceOfProductInBasket = function (data, event) {
        setInterval(5000);        
        var dataId = event.target.id;
        var dataValue = event.target.value
        if (dataValue <= 0) { dataValue = 1; }
        var splitId = dataId.split('_');    
        var IsKrone = isKrone(dataValue);
        if (IsKrone)
        {
          
        var obj = {
            productId: parseInt(splitId[1]),
            newPrice: dataValue,
            culture: $("#Culture").val()

        };
        setInterval(5000);
        $.ajax({
            url: "/Umbraco/surface/Basket/ChangePriceOfProductByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);
                   
                }
                else {
                    alert(data.Error);
                }
            },
            error: function (data) {

            }
        });

       }
        else
        {           
           bootbox.alert($("#ChangePriceMessage").val());
        }
    }.bind(self);




    self.AddProductInHistoryBasketToBasket = function (form) {

        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form.Amount.value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
            redirectCurrentPage: form.redirectCurrentPage.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {                 
                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value + "_" + form.basketId.value, ".addProductButton_" + form.productId.value + "_" + form.basketId.value);
                    ko.mapping.fromJS(data, self);
                }
                else {
                    $(".savingBasket_" + form.productId.value+"_"+ form.basketId.value).hide();
                    $(".addProductButton" + form.productId.value + "_" + form.basketId.value).show();
                    alert(data.Error);
                }
            },
            error: function (data) {

            }
        });

    }.bind(self);



    self.AddBrandProductToBasket = function (form) {

        var obj = {
            productId: parseInt(form.productId.value),
            classId: parseInt(form.classId.value),
            amount: parseInt(form[5].value),
            sumIfExists: form.sumIfExists.value == "true" ? true : false,
            culture: form.culture.value,
            redirectCurrentPage: form.redirectCurrentPage.value
        };
        $.ajax({
            url: "/Umbraco/surface/Basket/AddProductToBasketByIdAsJson",
            type: 'POST',
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(obj),
            success: function (data) {
                if (data.Error == null) {
                    ko.mapping.fromJS(data, self);
                    controlImageThemeBeforeAddProduct(".savingBasket_" + form.productId.value, ".searchResultButton_" + form.productId.value);
                }
                else {
                    $(".savingBasket_" + form.productId.value).hide();
                    $(".relateButton_" + form.productId.value).show();
                    alert(data.Error);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("error: " + errorThrown);
            }
        });
    }.bind(self);


}


function controlImageThemeBeforeAddProduct(savingBasketElement,addtocartButtonElement) {

    $(addtocartButtonElement).fadeOut(500
                    , function () {
                        $(savingBasketElement).fadeIn(2000);
                        controlImageThemeAfterAddProduct(savingBasketElement, addtocartButtonElement);
                    });

}


function controlImageThemeAfterAddProduct(savingBasketElement, addtocartButtonElement)
{
    $(savingBasketElement).fadeOut(1000
                    , function () {
                        $(addtocartButtonElement).fadeIn(500);
                    });  
}

