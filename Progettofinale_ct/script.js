var pag1;
var pag2;
var pag3;
var correction;
var place;
var person;
var normalization;
var erasures;
var delArray;
var personArray;
var placeArray;
var normalizationArray;
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

    pag2.classList.add("hide");
    pag3.classList.add("hide");

    delArray = document.getElementsByClassName("del");
    personArray = document.getElementsByClassName("person");
    placeArray = document.getElementsByClassName("place");
    normalizationArray = document.getElementsByClassName("normalization");

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
    } else{
        correction.setAttribute('checked','');
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
    } else{
        normalization.setAttribute('checked','');
        Array.from(normalizationArray).forEach(function(element) {
            element.classList.remove("hide");
            element.classList.add("nor");
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
window.onload = gestoreLoad()