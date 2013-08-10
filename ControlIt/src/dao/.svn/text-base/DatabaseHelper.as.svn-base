package dao
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	
	[Event(name="success", type="events.SyncEvent")]
	[Event(name="failure", type="events.SyncEvent")]
	public class DatabaseHelper extends EventDispatcher
	{
		public static var sqlConnection:SQLConnection;
		
		public static function openDatabase(file:File):void
		{
			var newDB:Boolean = true;
			if (file.exists)
				newDB = false;
			sqlConnection = new SQLConnection();
			sqlConnection.open(file);
			if (newDB)
			{
				createDatabase();
				//populateDatabase();
			}
		}
		protected static function dropDatabase():void
		{
			var sql:String = 
				"DROP TABLE expense";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();			
		}
		
		protected static function createDatabase():void
		{
			var sql:String = 
				"CREATE TABLE IF NOT EXISTS expense ( "+
				"id INTEGER PRIMARY KEY AUTOINCREMENT, " +
				"name VARCHAR(50), " +
				"value String, " +
				"type VARCHAR(1),"+
				"date TIMESTAMP,"+
				"img String)";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();			
		}
		
		protected function deleteData():void
		{
			var sql:String = "DELETE FROM expense";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();					
		}
	}
}