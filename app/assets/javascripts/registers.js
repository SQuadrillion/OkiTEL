$(function(){
  initializer();
  countTime();
});

function requestAPI(){
  url = "https://okoshite-nyan.herokuapp.com/api/call/remain_times"
  
  $.get(url, function(data){
    $.each(data, function(index, value){
      remain_times.push([data[index].id, data[index].time]);
    });
  });
};

function initializer(){
  requestAPI();
}

function countTime() {
  var startDateTime = new Date();
  var left_times = [];

  $.each(remain_times, function(index, value){
    current_datetime = Date.parse(remain_times[index][1]);
    left_times.push(current_datetime - startDateTime);
  });

  $.each(left_times, function(index, value){
    var a_day = 24 * 60 * 60 * 1000;
    // 期限から現在までの『残時間の日の部分』
    var d = Math.floor(left_times[index] / a_day)

    // 期限から現在までの『残時間の時間の部分』
    var h = Math.floor((left_times[index] % a_day) / (60 * 60 * 1000))

    // 残時間を秒で割って残分数を出す。
    // 残分数を60で割ることで、残時間の「時」の余りとして、『残時間の分の部分』を出す
    var m = Math.floor((left_times[index] % a_day) / (60 * 1000)) % 60

    // 残時間をミリ秒で割って、残秒数を出す。
    // 残秒数を60で割った余りとして、「秒」の余りとしての残「ミリ秒」を出す。
    // 更にそれを60で割った余りとして、「分」で割った余りとしての『残時間の秒の部分』を出す
    var s = Math.floor((left_times[index] % a_day) / 1000) % 60 % 60

    $("#r_" + remain_times[index][0] + "> div > div > div.col-xs-4 > div").text(m + ':' + s);
  });
  setTimeout('countTime()', 1000);
}