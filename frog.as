package  {
	
	import flash.display.MovieClip;
	
	
	public class frog extends MovieClip {
		
		private var is_happy:Boolean=false;//青蛙状态，高兴或难过
		public var nearby:Array = new Array();//临近的青蛙
		public var myNum:uint;
		public function frog() {
			// constructor code
			setMood(is_happy);
			
		}
		public  function changeMood():void{
			is_happy=(!is_happy);
			setMood(is_happy);
			trace(this.is_happy,this.nearby);
		}
		public function addNearby(near:frog){
			nearby.push(near);
			//link();
		}
		public function setMood (mood:Boolean){
			is_happy=mood;
			if (is_happy){
				gotoAndStop(1);
			}
			else{
				gotoAndStop(2);
			}
		}
		
		public function detectMood():Boolean{
			return is_happy;
		}
		/*private function link():void{
			graphics.lineStyle(2,0x00ffff,0.7);
		    for each (var k in nearby){
				trace(this.myNum);
				trace("ddddd"+k.myNum);
				graphics.moveTo(0,0);
				//graphics.lineTo(-k.x,k.y);
				trace(k.x,k.y);
				trace(this.myNum+".....");
			}
		}*/
	}
	
}
