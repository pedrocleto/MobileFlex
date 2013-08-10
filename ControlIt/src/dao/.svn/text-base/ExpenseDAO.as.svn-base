package dao
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.net.Responder;
	
	import model.Expense;
	
	import mx.collections.ArrayCollection;

	public class ExpenseDAO
	{
		
		private var _stmtGetUserData:SQLStatement;
		private var _stmtSaveUserData:SQLStatement;
		
		
		public function create(expense:Expense):void
		{
			var sql:String = 
				"INSERT INTO expense (name, value, type, date, img) " +
				"VALUES (?,?,?,?,?)";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = expense.name;
			stmt.parameters[1] = expense.value;
			/*stmt.parameters[2] = expense.color;*/
			stmt.parameters[2] = expense.type;
			if(expense.date)
			{
				stmt.parameters[3] = expense.date.getTime();
			}
			else
				stmt.parameters[3] = null;
			
			stmt.parameters[4] = expense.img;
			stmt.execute();
			//expense.loaded = true;
		}
		
		
		public function update(expense:Expense):void
		{
			var sql:String = 
				"UPDATE expense SET name=?, value=?, type=?, date=?, img=? " +
				"WHERE id=?";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = expense.name;
			stmt.parameters[1] = expense.value;
			/*stmt.parameters[2] = expense.color;*/
			stmt.parameters[2] = expense.type;
			if(expense.date)
			{
				stmt.parameters[3] = expense.date.time;
			}
			else
				stmt.parameters[3] =null;
			stmt.parameters[4] = expense.img;

			stmt.parameters[5] = expense.id;
			stmt.execute();
			//expense.loaded = true;
		}
		
		public function getItemById(id:int):Expense
		{
			/*var sql:String = "SELECT id, name, value, color, type, date FROM expenses WHERE id=?";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = id;
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if (result && result.length == 1)
				return processRow(result[0]);
			else*/
				return null;
			
		}
		
		public function getAllItems():ArrayCollection
		{
			var arrayCol:ArrayCollection=new ArrayCollection();
			var sql:String = "SELECT * FROM expense";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if (result && result.length > 0)
			{
				return processResults(result);
			}				
			else
			{
				var addNew:ArrayCollection=new ArrayCollection();
				addNew.addItem(createDefaultExpense());
				return addNew;
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
				expense.img = obj.img == null ? "" : obj.img;
				
				processedResult.addItem(expense);
			}
			return processedResult;
		}
		
		/*public function getAllItems(expensesResponder:ExpensesResponder):ArrayCollection{
			var sql:String = "SELECT * FROM expense";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.execute(-1, expensesResponder);
			return expensesResponder.getExpenses();
		}*/		
		
		public function deleteItemsById(id:int):void
		{
			var sql:String = "DELETE FROM expense WHERE id=?";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = DatabaseHelper.sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = id;
			stmt.execute();
		}
	}
}