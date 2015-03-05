
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

namespace Combo.DAL
{
	public abstract class _Country : SqlClientEntity
	{
		public _Country()
		{
			this.QuerySource = "Country";
			this.MappingName = "Country";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_CountryLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int CountryID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.CountryID, CountryID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_CountryLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter CountryID
			{
				get
				{
					return new SqlParameter("@CountryID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter IconPath
			{
				get
				{
					return new SqlParameter("@IconPath", SqlDbType.NVarChar, 200);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string CountryID = "CountryID";
            public const string Name = "Name";
            public const string IconPath = "IconPath";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[CountryID] = _Country.PropertyNames.CountryID;
					ht[Name] = _Country.PropertyNames.Name;
					ht[IconPath] = _Country.PropertyNames.IconPath;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string CountryID = "CountryID";
            public const string Name = "Name";
            public const string IconPath = "IconPath";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[CountryID] = _Country.ColumnNames.CountryID;
					ht[Name] = _Country.ColumnNames.Name;
					ht[IconPath] = _Country.ColumnNames.IconPath;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string CountryID = "s_CountryID";
            public const string Name = "s_Name";
            public const string IconPath = "s_IconPath";

		}
		#endregion		
		
		#region Properties
	
		public virtual int CountryID
	    {
			get
	        {
				return base.Getint(ColumnNames.CountryID);
			}
			set
	        {
				base.Setint(ColumnNames.CountryID, value);
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

		public virtual string IconPath
	    {
			get
	        {
				return base.Getstring(ColumnNames.IconPath);
			}
			set
	        {
				base.Setstring(ColumnNames.IconPath, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_CountryID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CountryID) ? string.Empty : base.GetintAsString(ColumnNames.CountryID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CountryID);
				else
					this.CountryID = base.SetintAsString(ColumnNames.CountryID, value);
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

		public virtual string s_IconPath
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.IconPath) ? string.Empty : base.GetstringAsString(ColumnNames.IconPath);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.IconPath);
				else
					this.IconPath = base.SetstringAsString(ColumnNames.IconPath, value);
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
				
				
				public WhereParameter CountryID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CountryID, Parameters.CountryID);
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

				public WhereParameter IconPath
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.IconPath, Parameters.IconPath);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter CountryID
		    {
				get
		        {
					if(_CountryID_W == null)
	        	    {
						_CountryID_W = TearOff.CountryID;
					}
					return _CountryID_W;
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

			public WhereParameter IconPath
		    {
				get
		        {
					if(_IconPath_W == null)
	        	    {
						_IconPath_W = TearOff.IconPath;
					}
					return _IconPath_W;
				}
			}

			private WhereParameter _CountryID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _IconPath_W = null;

			public void WhereClauseReset()
			{
				_CountryID_W = null;
				_Name_W = null;
				_IconPath_W = null;

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
				
				
				public AggregateParameter CountryID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CountryID, Parameters.CountryID);
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

				public AggregateParameter IconPath
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.IconPath, Parameters.IconPath);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter CountryID
		    {
				get
		        {
					if(_CountryID_W == null)
	        	    {
						_CountryID_W = TearOff.CountryID;
					}
					return _CountryID_W;
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

			public AggregateParameter IconPath
		    {
				get
		        {
					if(_IconPath_W == null)
	        	    {
						_IconPath_W = TearOff.IconPath;
					}
					return _IconPath_W;
				}
			}

			private AggregateParameter _CountryID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _IconPath_W = null;

			public void AggregateClauseReset()
			{
				_CountryID_W = null;
				_Name_W = null;
				_IconPath_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CountryInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.CountryID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CountryUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CountryDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.CountryID);
			p.SourceColumn = ColumnNames.CountryID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.CountryID);
			p.SourceColumn = ColumnNames.CountryID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.IconPath);
			p.SourceColumn = ColumnNames.IconPath;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
