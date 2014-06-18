package signals 
{
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class SignalCoupleing 
	{
		public var _signal:Signal;
		public var _callBacks:Vector.<Function> = new Vector.<Function>;
		
		/**
		 * 
		 */
		public function set signal(val:Signal):void
		{
			_signal = val;
		}
		
		/**
		 * 
		 */
		public function set callBacks(val:Vector.<Function>):void
		{
			_callBacks = val;
			for (var i:uint = 0; i < _callBacks.length; i++ )
			{
				_signal.add(_callBacks[i]);
			}
		}
		
		/**
		 * 
		 */
		public function get signal():Signal
		{
			return _signal;
		}
		
		/**
		 * 
		 * @param	callBack
		 */
		public function addCallBack(callBack:Function):void
		{
			_callBacks.push(callBack);
			_signal.add(callBack);
		}
		
		/**
		 * 
		 * @param	listener
		 */
		public function removeListener(listener:Function):void
		{
			for (var i:uint = 0; i < _callBacks.length; i++ )
			{
				if (_callBacks[i] == listener)
				{
					_callBacks.splice(i,1);
				}
			}
		}
		
		/**
		 * 
		 */
		public function removeAllListeners():void
		{
			_callBacks.length = 0;
		}
		
	}

}