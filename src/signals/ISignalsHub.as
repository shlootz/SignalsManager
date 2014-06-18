package signals 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface ISignalsHub 
	{
		 function addSignal(signalName:String, signal:Object, anchorPoints:Vector.<Function> = null):void
		 function dispatchSignal(signalName:String, event:String, obj:Object = null):void
		 function addListenerToSignal(signalName:String, eventListener:Function):void
		 function getRegisteredSignals():Dictionary
		 function removeListenerFromSignal(signalName:String, listener:Function):void
		 function removeAllListenersFromSignal(signalName:String):void
	}
	
}