
*** Variables ***
${email}                id:email
${bikeName}             id:name
${bikeBrand}            id:brand
${bikePrice}            xpath://input[@placeholder = "Valor cobrado por dia"]
${thumbnailInput}       css:#thumbnail input
${bikeRegister}         css:.btn-red
${bikeList}             css:.bike-list li
${bikeItem}             css:.bike-list
${buttonEnter}          xpath://button[contains(text(), "Quero Anúnciar")]
${dashboard}            class:dashboard
${alert}                class:alert-dark
${alertError}           class:alert-error
${buttonAnunciar}       //button[contains(text(), "Criar")]
${url}                  http://bikelov-anunciante.herokuapp.com/
${emailID}              id:email 
${bike}=                {"thumb": "elleven.jpg","name": "Rocker 26 marchas", "brand": "Shimano", "price":"15" }

### Campos obrigatorios
${no_thumb}=            {"thumb": "","name": "Rocker 26 marchas", "brand": "Shimano", "price":"15" }
${no_name}=            {"thumb": "elleven.jpg","name": "", "brand": "Shimano", "price":"15" }
${no_brand}=            {"thumb": "elleven.jpg","name": "Rocker 26 marchas", "brand": "", "price":"15" }