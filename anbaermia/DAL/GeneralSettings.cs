
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
	public abstract class _GeneralSettings : SqlClientEntity
	{
		public _GeneralSettings()
		{
			this.QuerySource = "GeneralSettings";
			this.MappingName = "GeneralSettings";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_GeneralSettingsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int GeneralSettingsID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.GeneralSettingsID, GeneralSettingsID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_GeneralSettingsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter GeneralSettingsID
			{
				get
				{
					return new SqlParameter("@GeneralSettingsID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter Value
			{
				get
				{
					return new SqlParameter("@Value", SqlDbType.NVarChar, 1073741823);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string GeneralSettingsID = "GeneralSettingsID";
            public const string Name = "Name";
            public const string Value = "value";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[GeneralSettingsID] = _GeneralSettings.PropertyNames.GeneralSettingsID;
					ht[Name] = _GeneralSettings.PropertyNames.Name;
					ht[Value] = _GeneralSettings.PropertyNames.Value;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string GeneralSettingsID = "GeneralSettingsID";
            public const string Name = "Name";
            public const string Value = "Value";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[GeneralSettingsID] = _GeneralSettings.ColumnNames.GeneralSettingsID;
					ht[Name] = _GeneralSettings.ColumnNames.Name;
					ht[Value] = _GeneralSettings.ColumnNames.Value;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string GeneralSettingsID = "s_GeneralSettingsID";
            public const string Name = "s_Name";
            public const string Value = "s_Value";

		}
		#endregion		
		
		#region Properties
	
		public virtual int GeneralSettingsID
	    {
			get
	        {
				return base.Getint(ColumnNames.GeneralSettingsID);
			}
			set
	        {
				base.Setint(ColumnNames.GeneralSettingsID, value);
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

		public virtual string Value
	    {
			get
	        {
				return base.Getstring(ColumnNames.Value);
			}
			set
	        {
				base.Setstring(ColumnNames.Value, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_GeneralSettingsID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.GeneralSettingsID) ? string.Empty : base.GetintAsString(ColumnNames.GeneralSettingsID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.GeneralSettingsID);
				else
					this.GeneralSettingsID = base.SetintAsString(ColumnNames.GeneralSettingsID, value);
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

		public virtual string s_Value
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Value) ? string.Empty : base.GetstringAsString(ColumnNames.Value);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Value);
				else
					this.Value = base.SetstringAsString(ColumnNames.Value, value);
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
				
				
				public WhereParameter GeneralSettingsID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.GeneralSettingsID, Parameters.GeneralSettingsID);
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

				public WhereParameter Value
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Value, Parameters.Value);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter GeneralSettingsID
		    {
				get
		        {
					if(_GeneralSettingsID_W == null)
	        	    {
						_GeneralSettingsID_W = TearOff.GeneralSettingsID;
					}
					return _GeneralSettingsID_W;
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

			public WhereParameter Value
		    {
				get
		        {
					if(_Value_W == null)
	        	    {
						_Value_W = TearOff.Value;
					}
					return _Value_W;
				}
			}

			private WhereParameter _GeneralSettingsID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _Value_W = null;

			public void WhereClauseReset()
			{
				_GeneralSettingsID_W = null;
				_Name_W = null;
				_Value_W = null;

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
				
				
				public AggregateParameter GeneralSettingsID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.GeneralSettingsID, Parameters.GeneralSettingsID);
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

				public AggregateParameter Value
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Value, Parameters.Value);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter GeneralSettingsID
		    {
				get
		        {
					if(_GeneralSettingsID_W == null)
	        	    {
						_GeneralSettingsID_W = TearOff.GeneralSettingsID;
					}
					return _GeneralSettingsID_W;
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

			public AggregateParameter Value
		    {
				get
		        {
					if(_Value_W == null)
	        	    {
						_Value_W = TearOff.Value;
					}
					return _Value_W;
				}
			}

			private AggregateParameter _GeneralSettingsID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _Value_W = null;

			public void AggregateClauseReset()
			{
				_GeneralSettingsID_W = null;
				_Name_W = null;
				_Value_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GeneralSettingsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.GeneralSettingsID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GeneralSettingsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_GeneralSettingsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.GeneralSettingsID);
			p.SourceColumn = ColumnNames.GeneralSettingsID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.GeneralSettingsID);
			p.SourceColumn = ColumnNames.GeneralSettingsID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Value);
			p.SourceColumn = ColumnNames.Value;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
