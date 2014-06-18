package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import org.osflash.signals.Signal;
	import signals.SignalCoupleing;
	import signals.SignalsHub;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class Main extends Sprite 
	{
		
		/**
		 * 
		 */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}