package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class MC2 extends MovieClip {
		private static const HAPPY:Boolean = true;
		private static const SAD:Boolean = false;
		
		
		//定义要加到屏幕的青蛙
		private var frog1:frog = new frog();
		private var frog2:frog = new frog();
		private var frog3:frog = new frog();
		private var frog4:frog = new frog();
		private var frogArray:Array = new Array();
		
		private var win:Boolean = false;//通关标志位
		
		public function MC2() {
			levelRecorder.level = 2;//把当前关卡数记录到levelRecorder里
			
			//在屏幕上初始化若干青蛙
			frog1.setMood(HAPPY);
			frog1.x=100;
			frog1.y=300;

			frog2.setMood(SAD);
			frog2.x=220;
			frog2.y=100;
			
            frog3.setMood(SAD);
			frog3.x=350;
			frog3.y=300;
			
			frog4.setMood(HAPPY);
			frog4.x=500;
			frog4.y=300;

			
			//青蛙间建立邻居关系
			
			frog1.addNearby(frog2);
			frog2.addNearby(frog1);
			frog2.addNearby(frog3);
			frog3.addNearby(frog2);
			frog3.addNearby(frog4);
			frog4.addNearby(frog3);
			
			//给舞台加上checkAll的监听器，检测是否通关。。。给MC1加上onClick监听器，来改变青蛙状态
			stage.addEventListener(Event.ENTER_FRAME,checkAll);
			this.addEventListener(MouseEvent.CLICK,onClick);
			
			//相邻的青蛙连线
			link(frog1,frog2);
			link(frog2,frog3);
			link(frog3,frog4);

            //青蛙的引用放入数组，方便遍历。
			frogArray.push(frog1);
			frogArray.push(frog2);
			frogArray.push(frog3);
			frogArray.push(frog4);
			
			for  (var k in frogArray){
				addChild(frogArray[k]);
			}
		}
		
		
		// 检测点击，改变青蛙状态
		private function onClick(e:MouseEvent):void{
			trace(e.target.myNum);
			trace(e.target.nearby.length);
			for each(var k in e.target.nearby){
				k.changeMood();
			}
			e.target.changeMood();

		}
		
		//仅为测试代码，用完即删
		private function showPos(e:MouseEvent):void{
			trace(mouseX,mouseY);
			trace("showpos"+frog1.x,frog1.y,frog2.x,frog2.y);
			trace("stage"+e.stageX,e.stageY+"..."+mouseX,mouseY);
		}
		
		//青蛙间连线的函数
		private function link(f1:frog,f2:frog){
			graphics.lineStyle(2,0x00ffff,1.0);
			graphics.moveTo(f1.x,f1.y);
			graphics.lineTo(f2.x,f2.y);
		}
		
		//检测是否通关
		private function checkAll(e:Event):void{
			if(!win){
				for each (var f in frogArray){
				    if (f.detectMood() == false) return;
			    }
				trace("you win");
			    var next_level:nextLevel = new nextLevel();
			    next_level.x =427;
			    next_level.y =240;
			    addChild(next_level);
			    win = true;
				this.removeEventListener(MouseEvent.CLICK,onClick);
			
		    }
		}
			
	}
	
}
