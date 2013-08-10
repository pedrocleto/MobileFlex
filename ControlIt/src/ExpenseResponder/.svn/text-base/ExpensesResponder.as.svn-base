package ExpenseResponder
{
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.net.Responder;
	
	import model.Expense;
	
	import mx.collections.ArrayCollection;

	public class ExpensesResponder extends Responder{
		private var expList:ArrayCollection=new ArrayCollection();
		
		public function ExpensesResponder(){
			super(buildExpensesList, logError);
		}
		
		public function buildExpensesList(result:SQLResult):void{
			var exp:Expense;
			expList=new ArrayCollection();
			
			if (result && result.data != null && result.data.length > 0)
			{
				expList=processResults(result.data);
			}				
			else
			{
				var addNew:ArrayCollection=new ArrayCollection();
				addNew.addItem(createDefaultExpense());
				expList=addNew;
			}
		}
		
		public function createDefaultExpense():Expense
		{
			var addNewExpense:Expense = new Expense();
			
			addNewExpense.id = -1;
			addNewExpense.name = "Tap to Add New Expense";
			addNewExpense.value = null;
			addNewExpense.type = null;
			return addNewExpense;
		}
		
		protected function processResults(arr:Array):ArrayCollection
		{
			var len:int=arr.length;
			var processedResult:ArrayCollection=new ArrayCollection();
			var total:Number=0;
			for(var i:int=0; i< len;i++)
			{
				var obj:Object=arr[i];
				
				var expense:Expense = new Expense();
				expense.id = obj.id;
				expense.name = obj.name == null ? "" : obj.name;
				expense.value = obj.value == null ? "" :obj.value;
				expense.type = obj.type == null ? "" : obj.type;
				expense.date = obj.date==null ? null : new Date(obj.date);
				expense.img = obj.img == null ? null : obj.img;
				
				processedResult.addItem(expense);
			}
			return processedResult;
		}
		
		public function logError(error:SQLError):void{
			trace(error);
		}		
		
		public function getExpenses():ArrayCollection{
			return expList;
		}
	}
}