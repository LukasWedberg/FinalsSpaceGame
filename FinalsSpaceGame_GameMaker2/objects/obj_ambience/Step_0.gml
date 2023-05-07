/// @description Insert description here
// You can write your code in this editor

currently_playing = false;

for(i = 0; i < ds_list_size(ambience_list); i++ ){
	if(audio_is_playing(i)){
		currently_playing = true;
	}

}

if(!currently_playing){
	audio_play_sound(  ambience_list[|irandom(4)], 10, false);
}