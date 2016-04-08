/*
 * 난 이 함수들을 설명할 실로 놀라운 주석을 발견했다
 * 하지만 여백이 부족해 적지 않겠다
 */
function randomIndex(length) {
  return Math.floor(Math.random()*length);
};

$.roulette_effect = function(list){
  return setInterval(function(){
    $('#roulette').text(list[randomIndex(list.length)]);
  },100);
};

$.append_result = function(data){
  for (i = 0; i < data.teams.length; i++){
    $('#list_body').append('<span id="team'+i+'" class="team_number">'+i+'조</span>');
    for(j = 0; j < data.teams[i].length; j++){
      $('#list_body').append('<a id="'+data.teams[i][j]+'" class="member_name">'+data.teams[i][j]+'</a>');
    }
    $('#list_body').append('<br><br>');
  };
  $('#list_body').append('<h4 id="end" style="display: none;" center>끝</h4>');
  var roulette = $.roulette_effect(["김경도","김권봉","김근영","김태완","박승환","서동욱","서수빈","손병찬","송기서","송재윤","유진영","윤현영","이상진","이현민","임정건"])
  $.show_result(0,data,roulette);
};

$.show_result = function(team_index, data, roulette) {
  if (team_index < data.teams.length) {
    $('#team'+team_index).toggle( "pulsate" );
    $.show_within_team(0,data.teams[team_index]);
    setTimeout(function(){
      $('#roulette').show();
      $('#picked').hide();
      $.show_result(team_index + 1, data, roulette)
    }, 1500*(data.teams[team_index].length + 1.5));
  }
  else {
    clearInterval(roulette)
    $('#roulette').text('조추첨 결과');
    $('#end').toggle('blind');
  };
};

$.show_within_team = function(i, list) {
  setTimeout(function(){
    if (i < list.length) {
      $('#roulette').hide();
      $('#picked').show();
      $('#picked').text(list[i]);
      $('#picked').toggle( "bounce", { times: 3 }, "slow" );
      $('#picked').toggle( "bounce", { times: 3 }, "fast" );
      $('#'+list[i]).toggle("fade");
      $.show_within_team(i+1, list, roulette);
    }
  }, 1500);
}

$.count_down = function(count, data){
  setTimeout(function(){
    now = count - 1;
    $('#count_num').text(now);
    if (count > 0) $.count_down(now, data);
    else {
      $('#list_body').empty();
      $('#count_down').hide();
      $('#team_list').show();
      $.append_result(data);
    }
  }, 1000);
};
