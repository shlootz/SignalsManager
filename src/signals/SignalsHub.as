package signals 
{
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class SignalsHub implements ISignalsHub
	{
		
		private var _signalsDictionary:Dictionary = new Dictionary(true);
		
		/**
		 * 
		 * @return
		 */
		public function SignalsHub()
		{
			
		}
		
		/**
		 * 
		 * @param	signalName
		 * @param	signal
		 */
		public function addSignal(signalName:String, signal:Object, anchorPoints:Vector.<Function> = null):void
		{
			var coupleing:SignalCoupleing = new SignalCoupleing();
			coupleing._signalName = signalName;
			coupleing.signal = signal as Signal;
			
			if (anchorPoints != null)
			{
				coupleing.callBacks = anchorPoints;
			}
			else
			{
				coupleing.callBacks = new Vector.<Function>
			}
			
			_signalsDictionary[signalName] = coupleing;
		}
		
		/**
		 * 
		 * @param	signalName
		 * @return
		 */
		public function dispatchSignal(signalName:String, event:String, obj:Object = null):void
		{
			//trace("Signals :: trying to dispatch " + signalName + " -> dict -> "+_signalsDictionary[signalName]);
			if (_signalsDictionary[signalName] != null)
			{
				//try
				//{
					var coupleing:SignalCoupleing = _signalsDictionary[signalName];
					
					if (obj != null)
					{
						coupleing.signal.dispatch(event, obj);
					}
					else
					{
						coupleing.signal.dispatch(event);
					}
				}
				//catch (e:Error)
				//{
					//trace("Assets Manager :: Coupleing error :: "+signalName+" :: missing registered signal " + e);
				//}
			//}
			else
			{
				trace("Signals :: signal "+signalName+" not registered!")
			}
		}
		
		/**
		 * 
		 * @param	signalName
		 * @param	eventListener
		 */
		public function addListenerToSignal(signalName:String, eventListener:Function):void
		{
			//trace("Signals :: trying to add listener "+eventListener+" to signal " + signalName);
			try
			{
				var  signalCouple:SignalCoupleing = _signalsDictionary[signalName];
				signalCouple.addCallBack(eventListener);
			}
			catch (e:Error)
			{
				trace("SignalsHub Error :: signal "+signalName+" not mapped in dictionary " + e);
			}
		}
		
		/**
		 * 
		 * @param	signalName
		 * @param	listener
		 */
		public function removeListenerFromSignal(signalName:String, listener:Function):void
		{
			var coupleing:SignalCoupleing = _signalsDictionary[signalName];
			
			coupleing.removeListener(listener);
		}
		
		/**
		 * 
		 * @param	signalName
		 */
		public function removeAllListenersFromSignal(signalName:String):void
		{
			var coupleing:SignalCoupleing = _signalsDictionary[signalName];
			
			coupleing.removeAllListeners();
		}
		
		/**
		 * 
		 * @return
		 */
		public function getRegisteredSignals():Dictionary
		{
			return _signalsDictionary;
		}
		
	}

}