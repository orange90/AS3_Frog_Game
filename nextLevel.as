package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class nextLevel extends MovieClip {
		private static const LAST_LEVEL:uint = 8;
		
		public function nextLevel() {
			next_btn1.addEventListener(MouseEvent.CLICK,gotoNext);
			other_btn1.addEventListener(MouseEvent.CLICK,gotoSelect);
		}
		
		private function gotoNext(e:MouseEvent):void{
			levelRecorder.level++;
			if (levelRecorder.level > LAST_LEVEL){
				MovieClip(root).gotoAndStop("win");
			}
			else{
				var s:String = "level"+levelRecorder.level;
			    MovieClip(root).gotoAndStop(s);
			}
			
		}
		private function gotoSelect(e:MouseEvent):void{
			    MovieClip(root).gotoAndStop("select");
		}
	}
	
}
