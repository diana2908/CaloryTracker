function calendar(){
    var day = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    var month = ['January','February','March','April','May','June','July','August','September','October','November','December'];
    var d = new Date();
    var currentDate = day[d.getDay()] + ", " +  d.getDate() + " " +  month[d.getMonth()]+ " " +(1900+ d.getYear());
    document.getElementById("datkal").innerHTML = currentDate;
}

window.onload = calendar;

var foodList = '[{"id": "01", "name": "Mar", "calories": 100}, {"id": "02", "name": "Piept de pui", "calories": 250}, {"id": "03", "name": "Ou", "calories": 50},' +
    '{"id": "04", "name": "Carne de curcan", "calories": 179}, {"id": "05", "name": "Cartofi", "calories": 80}, {"id": "06", "name": "Crap", "calories": 104},' +
    '{"id": "07", "name": "Iaurt", "calories": 30}, {"id": "08", "name": "Capsuni", "calories": 43}, {"id": "09", "name": "Lamai", "calories": 30},' +
    '{"id": "10", "name": "Carne de porc", "calories": 268}]';
foodList = JSON.parse(foodList);

var skipDisableBreakfast = false;
var countBreakfast=0;
var disableCounterBreakfast=0;
var indexBreakfast=0;

var state = {
    breakfast: [],
    lunch: [],
    dinner: []
};

function addBreakfastFood() {
    if(countBreakfast > 0 && !skipDisableBreakfast) {
        var foodId = $('.foodBreakfast-' + disableCounterBreakfast + '').val();
        $('.foodBreakfast-' + disableCounterBreakfast + '').prop( "disabled", true );
        state.breakfast.push(foodId);
        disableCounterBreakfast++;
    }

    $('#breakfastFoodOptions')
        .append('<div style="text-align: center"><select class="foodBreakfast-' + indexBreakfast + '"  style="display:block; ">' +
            '<option></option>' +
            createSelect() +
            '</select><button id="foodBreakfast-' + indexBreakfast + '" onclick="removeBreakfast(\''+ indexBreakfast +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
            '</div><br>');

    skipDisableBreakfast=false;
    countBreakfast++;
    indexBreakfast++;
}


function createSelect() {
    var ipsDom = foodList.map(function (entry) {
        return '<option value="' + entry.id + '">' + entry.name + '</option>';
    });

    return ipsDom.join('');
}

function removeBreakfast(entryId) {

    var entryId = parseInt(entryId);
    var deletedValue = $('.foodBreakfast-' + entryId + '').val();
    $('.foodBreakfast-' + entryId + '').remove();
    $('#foodBreakfast-' + entryId + '').remove();
    for(var i=0; i < state.breakfast.length; i++) {
        if(state.breakfast[i] == deletedValue) {
            state.breakfast.splice(i, 1);
            break;
        }
    }
    disableCounterBreakfast= indexBreakfast-1;
    countBreakfast--;
}

function calculateBreakfast() {

    if(!$('.foodBreakfast-' + disableCounterBreakfast + '').prop('disabled')) {
        var foodId = $('.foodBreakfast-' + disableCounterBreakfast + '').val();
        $('.foodBreakfast-' + disableCounterBreakfast + '').prop("disabled", true);
        state.breakfast.push(foodId);
        disableCounterBreakfast++;
        skipDisableBreakfast = true;
    }

    var selectedFoodCalories=0;
    for(var i=0; i<state.breakfast.length; i++) {
        for(var j=0; j<foodList.length; j++) {
            if(state.breakfast[i] == foodList[j]["id"]) {
                selectedFoodCalories += foodList[j]["calories"];
            }
        }
    }
    $(".total-caloriesBreakfast").text(selectedFoodCalories);

    var lunchScore = parseInt($(".total-caloriesLunch").text());
    var dinnerScore = parseInt($(".total-caloriesDinner").text());
    var total = selectedFoodCalories + lunchScore + dinnerScore;
    $(".consumat").text(total);
}



var skipDisableLunch = false;
var countLunch=0;
var disableCounterLunch=0;
var indexLunch=0;

function addLunchtFood() {
    if(countLunch > 0 && !skipDisableLunch) {
        var foodId = $('.foodLunch-' + disableCounterLunch + '').val();
        $('.foodLunch-' + disableCounterLunch + '').prop( "disabled", true );
        state.lunch.push(foodId);
        disableCounterLunch++;
    }

    $('#lunchFoodOptions')
        .append('<div style="text-align: center"><select class="foodLunch-' + indexLunch + '"  style="display:block; ">' +
            '<option></option>' +
            createSelect() +
            '</select><button id="foodLunch-' + indexLunch + '" onclick="removeLunch(\''+ indexLunch +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
            '</div><br>');

    skipDisableLunch=false;
    countLunch++;
    indexLunch++;
}

function removeLunch(entryId) {

    var entryId = parseInt(entryId);
    var deletedValue = $('.foodLunch-' + entryId + '').val();
    $('.foodLunch-' + entryId + '').remove();
    $('#foodLunch-' + entryId + '').remove();
    for(var i=0; i < state.lunch.length; i++) {
        if(state.lunch[i] == deletedValue) {
            state.lunch.splice(i, 1);
            break;
        }
    }
    disableCounterLunch = indexLunch-1;
    countLunch--;
}

function calculateLunch() {
    if(!$('.foodLunch-' + disableCounterLunch + '').prop('disabled')) {
        var foodId = $('.foodLunch-' + disableCounterLunch + '').val();
        $('.foodLunch-' + disableCounterLunch + '').prop("disabled", true);
        state.lunch.push(foodId);
        disableCounterLunch++;
        skipDisableLunch = true;
    }

    var selectedFoodCalories=0;
    for(var i=0; i<state.lunch.length; i++) {
        for(var j=0; j<foodList.length; j++) {
            if(state.lunch[i] == foodList[j]["id"]) {
                selectedFoodCalories += foodList[j]["calories"];
            }
        }
    }
    $(".total-caloriesLunch").text(selectedFoodCalories);

    var breakfastScore = parseInt($(".total-caloriesBreakfast").text());
    var dinnerScore = parseInt($(".total-caloriesDinner").text());
    var total = selectedFoodCalories + breakfastScore + dinnerScore;
    $(".consumat").text(total);
}


var skipDisableDinner = false;
var countDinner=0;
var disableCounterDinner=0;
var indexDinner=0;

function addDinnerFood() {
    if(countDinner > 0 && !skipDisableDinner) {
        var foodId = $('.foodDinner-' + disableCounterDinner + '').val();
        $('.foodDinner-' + disableCounterDinner + '').prop( "disabled", true );
        state.dinner.push(foodId);
        disableCounterDinner++;
    }

    $('#dinnerFoodOptions')
        .append('<div style="text-align: center"><select class="foodDinner-' + indexDinner + '"  style="display:block; ">' +
            '<option></option>' +
            createSelect() +
            '</select><button id="foodDinner-' + indexDinner + '" onclick="removeDinner(\''+ indexDinner +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
            '</div><br>');

    skipDisableDinner=false;
    countDinner++;
    indexDinner++;
}

function removeDinner(entryId) {

    var entryId = parseInt(entryId);
    var deletedValue = $('.foodDinner-' + entryId + '').val();
    $('.foodDinner-' + entryId + '').remove();
    $('#foodDinner-' + entryId + '').remove();
    for(var i=0; i < state.dinner.length; i++) {
        if(state.dinner[i] == deletedValue) {
            state.dinner.splice(i, 1);
            break;
        }
    }
    disableCounterDinner = indexDinner-1;
    countDinner--;
}

function calculateDinner() {
    if(!$('.foodDinner-' + disableCounterDinner + '').prop('disabled')) {
        var foodId = $('.foodDinner-' + disableCounterDinner + '').val();
        $('.foodDinner-' + disableCounterDinner + '').prop("disabled", true);
        state.dinner.push(foodId);
        disableCounterDinner++;
        skipDisableDinner = true;
    }

    var selectedFoodCalories=0;
    for(var i=0; i<state.dinner.length; i++) {
        for(var j=0; j<foodList.length; j++) {
            if(state.dinner[i] == foodList[j]["id"]) {
                selectedFoodCalories += foodList[j]["calories"];
            }
        }
    }
    $(".total-caloriesDinner").text(selectedFoodCalories);

    var breakfastScore = parseInt($(".total-caloriesBreakfast").text());
    var lunchScore = parseInt($(".total-caloriesLunch").text());
    var total = selectedFoodCalories + breakfastScore + lunchScore;
    $(".consumat").text(total);
}