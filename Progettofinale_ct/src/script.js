var pag1;
var pag2;
var pag3;
var correction;
var place;
var person;
var normalization;
var erasures;
var abbrevation;
var supplied;
var corrArray;
var delArray;
var personArray;
var placeArray;
var normalizationArray;
var abbrevationArray;
var suppliedArray;
var zoneArray;
var pg=1;

function gestoreLoad(){
    pag1 = document.getElementById("pag1");
    pag2 = document.getElementById("pag2");
    pag3 = document.getElementById("pag3");
    correction = document.getElementById("correction");
    place = document.getElementById("place");
    person = document.getElementById("person");
    normalization = document.getElementById("normalization");
    erasures = document.getElementById("erasures"); 
    abbrevation = document.getElementById("abbrevation"); 
    supplied = document.getElementById("supplied"); 

    pag2.classList.add("hide");
    pag3.classList.add("hide");

    corrArray = document.getElementsByClassName("corr");
    sicArray = document.getElementsByClassName("sic");
    delArray = document.getElementsByClassName("del");
    origArray = document.getElementsByClassName("orig");
    personArray = document.getElementsByClassName("person");
    placeArray = document.getElementsByClassName("place");
    normalizationArray = document.getElementsByClassName("normalization");
    abbrevationArray = document.getElementsByClassName("expan");
    suppliedArray = document.getElementsByClassName("supplied");
    lineArray = document.getElementsByClassName("line");
}
var idZone;
var idLine;
function underlineStart(line){
    myId = line[0].getAttribute('id');
    Array.from(lineArray).forEach(function(element){
        idLine = element.getAttribute('id');
        if(idLine == myId){
            line[0].classList.add("evidence");
        }
    })
}
function underlineEnd(line){
    myId = line[0].getAttribute('id');
    Array.from(lineArray).forEach(function(element){
        idLine = element.getAttribute('id');
        if(idLine == myId){
            line[0].classList.remove("evidence");
        }
    })
}
function changePage(n){
    pg = pg+ n;
    if(pg == 4){
        pg = 1;
    } else if(pg == 0){
        pg = 3;
    }

    if(pg == 1){
        pag1.classList.remove("hide");
        pag2.classList.add("hide");
        pag3.classList.add("hide");
    }else if(pg == 2){
        pag2.classList.remove("hide");
        pag1.classList.add("hide");
        pag3.classList.add("hide");
    }else if(pg == 3){
        pag3.classList.remove("hide");
        pag1.classList.add("hide");
        pag2.classList.add("hide");
    }
}
function changeCorrection(){
    if(correction.hasAttribute('checked')){
        correction.removeAttribute('checked');
        Array.from(corrArray).forEach(function(element) {
            element.classList.add("hide");
            element.classList.remove("cor");
          });        
          Array.from(sicArray).forEach(function(element) {
            element.classList.remove("overstrike");
          });
    } else{
        correction.setAttribute('checked','');
        Array.from(corrArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("cor");
          });
          Array.from(sicArray).forEach(function(element) {
            element.classList.add("overstrike");
          });
    }
}
function changePlace(){
    if(place.hasAttribute('checked')){
        place.removeAttribute('checked');
        Array.from(placeArray).forEach(function(element) {
            element.classList.remove("pla");
          });
    } else{
        place.setAttribute('checked','');
        Array.from(placeArray).forEach(function(element) {
            element.classList.add("pla");
          });
    }
}
function changePerson(){
    if(person.hasAttribute('checked')){
        person.removeAttribute('checked');
        Array.from(personArray).forEach(function(element) {
            element.classList.remove("pers");
          });
    } else{
        person.setAttribute('checked','');
        Array.from(personArray).forEach(function(element) {
            element.classList.add("pers");
          });
    }
}
function changeNormalization(){
    if(normalization.hasAttribute('checked')){
        normalization.removeAttribute('checked');
        Array.from(normalizationArray).forEach(function(element) {
            element.classList.add("hide");
            element.classList.remove("nor");
          });
          Array.from(origArray).forEach(function(element) {
            element.classList.remove("overstrike");
          });
    } else{
        normalization.setAttribute('checked','');
        Array.from(normalizationArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("nor");
          });
          Array.from(origArray).forEach(function(element) {
            element.classList.add("overstrike");
          });
    }
}

function changeErasures(){
    if(erasures.hasAttribute('checked')){
        erasures.removeAttribute('checked');
        Array.from(delArray).forEach(function(element) {
            element.classList.add("hide");
            element.classList.remove("delete");
          });
    } else{
        erasures.setAttribute('checked','');
        Array.from(delArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("delete");
          });
    }
}

function changeAbbrevation(){
    if(abbrevation.hasAttribute('checked')){
        abbrevation.removeAttribute('checked');
        Array.from(abbrevationArray).forEach(function(element) {
            element.classList.add("hide");
            element.classList.remove("ex");
          });
    } else{
        abbrevation.setAttribute('checked','');
        Array.from(abbrevationArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("ex");
          });
    }
}
function changeSupplied(){
    if(supplied.hasAttribute('checked')){
        supplied.removeAttribute('checked');
        Array.from(suppliedArray).forEach(function(element) {
            element.classList.add("hide");
            element.classList.remove("supp");
          });
    } else{
        supplied.setAttribute('checked','');
        Array.from(suppliedArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("supp");
          });
    }
}
var elementList;
var openArrow;
var closeArrow;
function openMenu(list){
    elementList= list.getElementsByClassName("elementList");
    openArrow= document.getElementById("arrowbtn");
    closeArrow= document.getElementById("arrowbtn2");
    Array.from(elementList).forEach(function(element) {
        if(element.classList.contains('hide')){
            element.classList.remove("hide");
            element.classList.add("show");
            closeArrow.classList.remove("hide");
            openArrow.classList.add("hide");
        }else{
            element.classList.add("hide");
            element.classList.remove("show");
            closeArrow.classList.add("hide");
            openArrow.classList.remove("hide");
        }
      });
}
window.onload = gestoreLoad()