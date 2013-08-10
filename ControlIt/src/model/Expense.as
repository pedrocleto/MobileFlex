package model
{
	import flash.utils.ByteArray;

	[Bindable]
	public class Expense
	{				
		public var id:int;
		public var name:String;
		public var value:String;
		/*public var color:String;*/
		public var type:String;
		public var date:Date;
		public var img:String;
	}
}