
/*
'===============================================================================
'  Generated From - CSharp_dOOdads_BusinessEntity.vbgen
' 
'  ** IMPORTANT  ** 
'  How to Generate your stored procedures:
' 
'  SQL        = SQL_StoredProcs.vbgen
'  ACCESS     = Access_StoredProcs.vbgen
'  ORACLE     = Oracle_StoredProcs.vbgen
'  FIREBIRD   = FirebirdStoredProcs.vbgen
'  POSTGRESQL = PostgreSQL_StoredProcs.vbgen
'
'  The supporting base class SqlClientEntity is in the Architecture directory in "dOOdads".
'  
'  This object is 'abstract' which means you need to inherit from it to be able
'  to instantiate it.  This is very easilly done. You can override properties and
'  methods in your derived class, this allows you to regenerate this class at any
'  time and not worry about overwriting custom code. 
'
'  NEVER EDIT THIS FILE.
'
'  public class YourObject :  _YourObject
'  {
'
'  }
'
'===============================================================================
*/

// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DAL
{
	public abstract class _InvestorFile : SqlClientEntity
	{
		public _InvestorFile()
		{
			this.QuerySource = "InvestorFile";
			this.MappingName = "InvestorFile";

		}	

		//=================================================================
		//  public Overrides void AddNew()
		//=================================================================
		//
		//=================================================================
		public override void AddNew()
		{
			base.AddNew();
			
		}
		
		
		public override void FlushData()
		{
			this._whereClause = null;
			this._aggregateClause = null;
			base.FlushData();
		}
		
		//=================================================================
		//  	public Function LoadAll() As Boolean
		//=================================================================
		//  Loads all of the records in the database, and sets the currentRow to the first row
		//=================================================================
		public bool LoadAll() 
		{
			ListDictionary parameters = null;
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_InvestorFileLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int InvestorFileID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.InvestorFileID, InvestorFileID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_InvestorFileLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter InvestorFileID
			{
				get
				{
					return new SqlParameter("@InvestorFileID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter InvestorCatID
			{
				get
				{
					return new SqlParameter("@InvestorCatID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter FilePath
			{
				get
				{
					return new SqlParameter("@FilePath", SqlDbType.NVarChar, 500);
				}
			}
			
			public static SqlParameter WordFilePath
			{
				get
				{
					return new SqlParameter("@WordFilePath", SqlDbType.NVarChar, 500);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string InvestorFileID = "InvestorFileID";
            public const string InvestorCatID = "InvestorCatID";
            public const string Name = "Name";
            public const string FilePath = "FilePath";
            public const string WordFilePath = "WordFilePath";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[InvestorFileID] = _InvestorFile.PropertyNames.InvestorFileID;
					ht[InvestorCatID] = _InvestorFile.PropertyNames.InvestorCatID;
					ht[Name] = _InvestorFile.PropertyNames.Name;
					ht[FilePath] = _InvestorFile.PropertyNames.FilePath;
					ht[WordFilePath] = _InvestorFile.PropertyNames.WordFilePath;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string InvestorFileID = "InvestorFileID";
            public const string InvestorCatID = "InvestorCatID";
            public const string Name = "Name";
            public const string FilePath = "FilePath";
            public const string WordFilePath = "WordFilePath";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[InvestorFileID] = _InvestorFile.ColumnNames.InvestorFileID;
					ht[InvestorCatID] = _InvestorFile.ColumnNames.InvestorCatID;
					ht[Name] = _InvestorFile.ColumnNames.Name;
					ht[FilePath] = _InvestorFile.ColumnNames.FilePath;
					ht[WordFilePath] = _InvestorFile.ColumnNames.WordFilePath;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string InvestorFileID = "s_InvestorFileID";
            public const string InvestorCatID = "s_InvestorCatID";
            public const string Name = "s_Name";
            public const string FilePath = "s_FilePath";
            public const string WordFilePath = "s_WordFilePath";

		}
		#endregion		
		
		#region Properties
	
		public virtual int InvestorFileID
	    {
			get
	        {
				return base.Getint(ColumnNames.InvestorFileID);
			}
			set
	        {
				base.Setint(ColumnNames.InvestorFileID, value);
			}
		}

		public virtual int InvestorCatID
	    {
			get
	        {
				return base.Getint(ColumnNames.InvestorCatID);
			}
			set
	        {
				base.Setint(ColumnNames.InvestorCatID, value);
			}
		}

		public virtual string Name
	    {
			get
	        {
				return base.Getstring(ColumnNames.Name);
			}
			set
	        {
				base.Setstring(ColumnNames.Name, value);
			}
		}

		public virtual string FilePath
	    {
			get
	        {
				return base.Getstring(ColumnNames.FilePath);
			}
			set
	        {
				base.Setstring(ColumnNames.FilePath, value);
			}
		}

		public virtual string WordFilePath
	    {
			get
	        {
				return base.Getstring(ColumnNames.WordFilePath);
			}
			set
	        {
				base.Setstring(ColumnNames.WordFilePath, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_InvestorFileID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.InvestorFileID) ? string.Empty : base.GetintAsString(ColumnNames.InvestorFileID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.InvestorFileID);
				else
					this.InvestorFileID = base.SetintAsString(ColumnNames.InvestorFileID, value);
			}
		}

		public virtual string s_InvestorCatID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.InvestorCatID) ? string.Empty : base.GetintAsString(ColumnNames.InvestorCatID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.InvestorCatID);
				else
					this.InvestorCatID = base.SetintAsString(ColumnNames.InvestorCatID, value);
			}
		}

		public virtual string s_Name
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Name) ? string.Empty : base.GetstringAsString(ColumnNames.Name);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Name);
				else
					this.Name = base.SetstringAsString(ColumnNames.Name, value);
			}
		}

		public virtual string s_FilePath
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.FilePath) ? string.Empty : base.GetstringAsString(ColumnNames.FilePath);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.FilePath);
				else
					this.FilePath = base.SetstringAsString(ColumnNames.FilePath, value);
			}
		}

		public virtual string s_WordFilePath
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.WordFilePath) ? string.Empty : base.GetstringAsString(ColumnNames.WordFilePath);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.WordFilePath);
				else
					this.WordFilePath = base.SetstringAsString(ColumnNames.WordFilePath, value);
			}
		}


		#endregion		
	
		#region Where Clause
		public class WhereClause
		{
			public WhereClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffWhereParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffWhereParameter(this);
					}

					return _tearOff;
				}
			}

			#region WhereParameter TearOff's
			public class TearOffWhereParameter
			{
				public TearOffWhereParameter(WhereClause clause)
				{
					this._clause = clause;
				}
				
				
				public WhereParameter InvestorFileID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.InvestorFileID, Parameters.InvestorFileID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter InvestorCatID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.InvestorCatID, Parameters.InvestorCatID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Name
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter FilePath
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.FilePath, Parameters.FilePath);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter WordFilePath
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.WordFilePath, Parameters.WordFilePath);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter InvestorFileID
		    {
				get
		        {
					if(_InvestorFileID_W == null)
	        	    {
						_InvestorFileID_W = TearOff.InvestorFileID;
					}
					return _InvestorFileID_W;
				}
			}

			public WhereParameter InvestorCatID
		    {
				get
		        {
					if(_InvestorCatID_W == null)
	        	    {
						_InvestorCatID_W = TearOff.InvestorCatID;
					}
					return _InvestorCatID_W;
				}
			}

			public WhereParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public WhereParameter FilePath
		    {
				get
		        {
					if(_FilePath_W == null)
	        	    {
						_FilePath_W = TearOff.FilePath;
					}
					return _FilePath_W;
				}
			}

			public WhereParameter WordFilePath
		    {
				get
		        {
					if(_WordFilePath_W == null)
	        	    {
						_WordFilePath_W = TearOff.WordFilePath;
					}
					return _WordFilePath_W;
				}
			}

			private WhereParameter _InvestorFileID_W = null;
			private WhereParameter _InvestorCatID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _FilePath_W = null;
			private WhereParameter _WordFilePath_W = null;

			public void WhereClauseReset()
			{
				_InvestorFileID_W = null;
				_InvestorCatID_W = null;
				_Name_W = null;
				_FilePath_W = null;
				_WordFilePath_W = null;

				this._entity.Query.FlushWhereParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffWhereParameter _tearOff;
			
		}
	
		public WhereClause Where
		{
			get
			{
				if(_whereClause == null)
				{
					_whereClause = new WhereClause(this);
				}
		
				return _whereClause;
			}
		}
		
		private WhereClause _whereClause = null;	
		#endregion
	
		#region Aggregate Clause
		public class AggregateClause
		{
			public AggregateClause(BusinessEntity entity)
			{
				this._entity = entity;
			}
			
			public TearOffAggregateParameter TearOff
			{
				get
				{
					if(_tearOff == null)
					{
						_tearOff = new TearOffAggregateParameter(this);
					}

					return _tearOff;
				}
			}

			#region AggregateParameter TearOff's
			public class TearOffAggregateParameter
			{
				public TearOffAggregateParameter(AggregateClause clause)
				{
					this._clause = clause;
				}
				
				
				public AggregateParameter InvestorFileID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.InvestorFileID, Parameters.InvestorFileID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter InvestorCatID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.InvestorCatID, Parameters.InvestorCatID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Name
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter FilePath
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.FilePath, Parameters.FilePath);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter WordFilePath
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.WordFilePath, Parameters.WordFilePath);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter InvestorFileID
		    {
				get
		        {
					if(_InvestorFileID_W == null)
	        	    {
						_InvestorFileID_W = TearOff.InvestorFileID;
					}
					return _InvestorFileID_W;
				}
			}

			public AggregateParameter InvestorCatID
		    {
				get
		        {
					if(_InvestorCatID_W == null)
	        	    {
						_InvestorCatID_W = TearOff.InvestorCatID;
					}
					return _InvestorCatID_W;
				}
			}

			public AggregateParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public AggregateParameter FilePath
		    {
				get
		        {
					if(_FilePath_W == null)
	        	    {
						_FilePath_W = TearOff.FilePath;
					}
					return _FilePath_W;
				}
			}

			public AggregateParameter WordFilePath
		    {
				get
		        {
					if(_WordFilePath_W == null)
	        	    {
						_WordFilePath_W = TearOff.WordFilePath;
					}
					return _WordFilePath_W;
				}
			}

			private AggregateParameter _InvestorFileID_W = null;
			private AggregateParameter _InvestorCatID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _FilePath_W = null;
			private AggregateParameter _WordFilePath_W = null;

			public void AggregateClauseReset()
			{
				_InvestorFileID_W = null;
				_InvestorCatID_W = null;
				_Name_W = null;
				_FilePath_W = null;
				_WordFilePath_W = null;

				this._entity.Query.FlushAggregateParameters();

			}
	
			private BusinessEntity _entity;
			private TearOffAggregateParameter _tearOff;
			
		}
	
		public AggregateClause Aggregate
		{
			get
			{
				if(_aggregateClause == null)
				{
					_aggregateClause = new AggregateClause(this);
				}
		
				return _aggregateClause;
			}
		}
		
		private AggregateClause _aggregateClause = null;	
		#endregion
	
		protected override IDbCommand GetInsertCommand() 
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_InvestorFileInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.InvestorFileID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_InvestorFileUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_InvestorFileDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.InvestorFileID);
			p.SourceColumn = ColumnNames.InvestorFileID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.InvestorFileID);
			p.SourceColumn = ColumnNames.InvestorFileID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.InvestorCatID);
			p.SourceColumn = ColumnNames.InvestorCatID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.FilePath);
			p.SourceColumn = ColumnNames.FilePath;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.WordFilePath);
			p.SourceColumn = ColumnNames.WordFilePath;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
