package  {
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	
	public class toMain extends SimpleButton {
		
		
		public function toMain() {
			this.addEventListener(MouseEvent.CLICK,gotoMain);
		}
		private function gotoMain(e:MouseEvent){
			MovieClip(root).gotoAndStop("first");
		}
	}
	
}
