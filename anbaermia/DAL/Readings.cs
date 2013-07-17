
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

namespace ErmiaWS_DAL
{
	public abstract class _Readings : SqlClientEntity
	{
		public _Readings()
		{
			this.QuerySource = "Readings";
			this.MappingName = "Readings";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ReadingsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int ReadingsID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ReadingsID, ReadingsID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ReadingsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter ReadingsID
			{
				get
				{
					return new SqlParameter("@ReadingsID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ReadingsType
			{
				get
				{
					return new SqlParameter("@ReadingsType", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ArContent
			{
				get
				{
					return new SqlParameter("@ArContent", SqlDbType.NVarChar, 1073741823);
				}
			}
			
			public static SqlParameter ViewDate
			{
				get
				{
					return new SqlParameter("@ViewDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ReadingsID = "ReadingsID";
            public const string ReadingsType = "ReadingsType";
            public const string ArContent = "ArContent";
            public const string ViewDate = "ViewDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ReadingsID] = _Readings.PropertyNames.ReadingsID;
					ht[ReadingsType] = _Readings.PropertyNames.ReadingsType;
					ht[ArContent] = _Readings.PropertyNames.ArContent;
					ht[ViewDate] = _Readings.PropertyNames.ViewDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string ReadingsID = "ReadingsID";
            public const string ReadingsType = "ReadingsType";
            public const string ArContent = "ArContent";
            public const string ViewDate = "ViewDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ReadingsID] = _Readings.ColumnNames.ReadingsID;
					ht[ReadingsType] = _Readings.ColumnNames.ReadingsType;
					ht[ArContent] = _Readings.ColumnNames.ArContent;
					ht[ViewDate] = _Readings.ColumnNames.ViewDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string ReadingsID = "s_ReadingsID";
            public const string ReadingsType = "s_ReadingsType";
            public const string ArContent = "s_ArContent";
            public const string ViewDate = "s_ViewDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int ReadingsID
	    {
			get
	        {
				return base.Getint(ColumnNames.ReadingsID);
			}
			set
	        {
				base.Setint(ColumnNames.ReadingsID, value);
			}
		}

		public virtual int ReadingsType
	    {
			get
	        {
				return base.Getint(ColumnNames.ReadingsType);
			}
			set
	        {
				base.Setint(ColumnNames.ReadingsType, value);
			}
		}

		public virtual string ArContent
	    {
			get
	        {
				return base.Getstring(ColumnNames.ArContent);
			}
			set
	        {
				base.Setstring(ColumnNames.ArContent, value);
			}
		}

		public virtual DateTime ViewDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.ViewDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.ViewDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_ReadingsID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ReadingsID) ? string.Empty : base.GetintAsString(ColumnNames.ReadingsID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ReadingsID);
				else
					this.ReadingsID = base.SetintAsString(ColumnNames.ReadingsID, value);
			}
		}

		public virtual string s_ReadingsType
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ReadingsType) ? string.Empty : base.GetintAsString(ColumnNames.ReadingsType);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ReadingsType);
				else
					this.ReadingsType = base.SetintAsString(ColumnNames.ReadingsType, value);
			}
		}

		public virtual string s_ArContent
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ArContent) ? string.Empty : base.GetstringAsString(ColumnNames.ArContent);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ArContent);
				else
					this.ArContent = base.SetstringAsString(ColumnNames.ArContent, value);
			}
		}

		public virtual string s_ViewDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ViewDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.ViewDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ViewDate);
				else
					this.ViewDate = base.SetDateTimeAsString(ColumnNames.ViewDate, value);
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
				
				
				public WhereParameter ReadingsID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ReadingsID, Parameters.ReadingsID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ReadingsType
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ReadingsType, Parameters.ReadingsType);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ArContent
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ArContent, Parameters.ArContent);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ViewDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ViewDate, Parameters.ViewDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter ReadingsID
		    {
				get
		        {
					if(_ReadingsID_W == null)
	        	    {
						_ReadingsID_W = TearOff.ReadingsID;
					}
					return _ReadingsID_W;
				}
			}

			public WhereParameter ReadingsType
		    {
				get
		        {
					if(_ReadingsType_W == null)
	        	    {
						_ReadingsType_W = TearOff.ReadingsType;
					}
					return _ReadingsType_W;
				}
			}

			public WhereParameter ArContent
		    {
				get
		        {
					if(_ArContent_W == null)
	        	    {
						_ArContent_W = TearOff.ArContent;
					}
					return _ArContent_W;
				}
			}

			public WhereParameter ViewDate
		    {
				get
		        {
					if(_ViewDate_W == null)
	        	    {
						_ViewDate_W = TearOff.ViewDate;
					}
					return _ViewDate_W;
				}
			}

			private WhereParameter _ReadingsID_W = null;
			private WhereParameter _ReadingsType_W = null;
			private WhereParameter _ArContent_W = null;
			private WhereParameter _ViewDate_W = null;

			public void WhereClauseReset()
			{
				_ReadingsID_W = null;
				_ReadingsType_W = null;
				_ArContent_W = null;
				_ViewDate_W = null;

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
				
				
				public AggregateParameter ReadingsID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ReadingsID, Parameters.ReadingsID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ReadingsType
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ReadingsType, Parameters.ReadingsType);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ArContent
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ArContent, Parameters.ArContent);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ViewDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ViewDate, Parameters.ViewDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter ReadingsID
		    {
				get
		        {
					if(_ReadingsID_W == null)
	        	    {
						_ReadingsID_W = TearOff.ReadingsID;
					}
					return _ReadingsID_W;
				}
			}

			public AggregateParameter ReadingsType
		    {
				get
		        {
					if(_ReadingsType_W == null)
	        	    {
						_ReadingsType_W = TearOff.ReadingsType;
					}
					return _ReadingsType_W;
				}
			}

			public AggregateParameter ArContent
		    {
				get
		        {
					if(_ArContent_W == null)
	        	    {
						_ArContent_W = TearOff.ArContent;
					}
					return _ArContent_W;
				}
			}

			public AggregateParameter ViewDate
		    {
				get
		        {
					if(_ViewDate_W == null)
	        	    {
						_ViewDate_W = TearOff.ViewDate;
					}
					return _ViewDate_W;
				}
			}

			private AggregateParameter _ReadingsID_W = null;
			private AggregateParameter _ReadingsType_W = null;
			private AggregateParameter _ArContent_W = null;
			private AggregateParameter _ViewDate_W = null;

			public void AggregateClauseReset()
			{
				_ReadingsID_W = null;
				_ReadingsType_W = null;
				_ArContent_W = null;
				_ViewDate_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ReadingsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.ReadingsID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ReadingsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ReadingsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ReadingsID);
			p.SourceColumn = ColumnNames.ReadingsID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.ReadingsID);
			p.SourceColumn = ColumnNames.ReadingsID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ReadingsType);
			p.SourceColumn = ColumnNames.ReadingsType;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ArContent);
			p.SourceColumn = ColumnNames.ArContent;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ViewDate);
			p.SourceColumn = ColumnNames.ViewDate;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}