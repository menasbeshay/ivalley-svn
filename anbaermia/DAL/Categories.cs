
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
	public abstract class _Categories : SqlClientEntity
	{
		public _Categories()
		{
			this.QuerySource = "Categories";
			this.MappingName = "Categories";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_CategoriesLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int CategoryID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.CategoryID, CategoryID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_CategoriesLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter CategoryID
			{
				get
				{
					return new SqlParameter("@CategoryID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter TypeID
			{
				get
				{
					return new SqlParameter("@TypeID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Title
			{
				get
				{
					return new SqlParameter("@Title", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter IconPath
			{
				get
				{
					return new SqlParameter("@IconPath", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter PageID
			{
				get
				{
					return new SqlParameter("@PageID", SqlDbType.Int, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string CategoryID = "CategoryID";
            public const string TypeID = "TypeID";
            public const string Title = "Title";
            public const string IconPath = "IconPath";
            public const string PageID = "PageID";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[CategoryID] = _Categories.PropertyNames.CategoryID;
					ht[TypeID] = _Categories.PropertyNames.TypeID;
					ht[Title] = _Categories.PropertyNames.Title;
					ht[IconPath] = _Categories.PropertyNames.IconPath;
					ht[PageID] = _Categories.PropertyNames.PageID;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string CategoryID = "CategoryID";
            public const string TypeID = "TypeID";
            public const string Title = "Title";
            public const string IconPath = "IconPath";
            public const string PageID = "PageID";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[CategoryID] = _Categories.ColumnNames.CategoryID;
					ht[TypeID] = _Categories.ColumnNames.TypeID;
					ht[Title] = _Categories.ColumnNames.Title;
					ht[IconPath] = _Categories.ColumnNames.IconPath;
					ht[PageID] = _Categories.ColumnNames.PageID;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string CategoryID = "s_CategoryID";
            public const string TypeID = "s_TypeID";
            public const string Title = "s_Title";
            public const string IconPath = "s_IconPath";
            public const string PageID = "s_PageID";

		}
		#endregion		
		
		#region Properties
	
		public virtual int CategoryID
	    {
			get
	        {
				return base.Getint(ColumnNames.CategoryID);
			}
			set
	        {
				base.Setint(ColumnNames.CategoryID, value);
			}
		}

		public virtual int TypeID
	    {
			get
	        {
				return base.Getint(ColumnNames.TypeID);
			}
			set
	        {
				base.Setint(ColumnNames.TypeID, value);
			}
		}

		public virtual string Title
	    {
			get
	        {
				return base.Getstring(ColumnNames.Title);
			}
			set
	        {
				base.Setstring(ColumnNames.Title, value);
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

		public virtual int PageID
	    {
			get
	        {
				return base.Getint(ColumnNames.PageID);
			}
			set
	        {
				base.Setint(ColumnNames.PageID, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_CategoryID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CategoryID) ? string.Empty : base.GetintAsString(ColumnNames.CategoryID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CategoryID);
				else
					this.CategoryID = base.SetintAsString(ColumnNames.CategoryID, value);
			}
		}

		public virtual string s_TypeID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.TypeID) ? string.Empty : base.GetintAsString(ColumnNames.TypeID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.TypeID);
				else
					this.TypeID = base.SetintAsString(ColumnNames.TypeID, value);
			}
		}

		public virtual string s_Title
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Title) ? string.Empty : base.GetstringAsString(ColumnNames.Title);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Title);
				else
					this.Title = base.SetstringAsString(ColumnNames.Title, value);
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

		public virtual string s_PageID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PageID) ? string.Empty : base.GetintAsString(ColumnNames.PageID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PageID);
				else
					this.PageID = base.SetintAsString(ColumnNames.PageID, value);
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
				
				
				public WhereParameter CategoryID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CategoryID, Parameters.CategoryID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter TypeID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.TypeID, Parameters.TypeID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Title
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Title, Parameters.Title);
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

				public WhereParameter PageID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PageID, Parameters.PageID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter CategoryID
		    {
				get
		        {
					if(_CategoryID_W == null)
	        	    {
						_CategoryID_W = TearOff.CategoryID;
					}
					return _CategoryID_W;
				}
			}

			public WhereParameter TypeID
		    {
				get
		        {
					if(_TypeID_W == null)
	        	    {
						_TypeID_W = TearOff.TypeID;
					}
					return _TypeID_W;
				}
			}

			public WhereParameter Title
		    {
				get
		        {
					if(_Title_W == null)
	        	    {
						_Title_W = TearOff.Title;
					}
					return _Title_W;
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

			public WhereParameter PageID
		    {
				get
		        {
					if(_PageID_W == null)
	        	    {
						_PageID_W = TearOff.PageID;
					}
					return _PageID_W;
				}
			}

			private WhereParameter _CategoryID_W = null;
			private WhereParameter _TypeID_W = null;
			private WhereParameter _Title_W = null;
			private WhereParameter _IconPath_W = null;
			private WhereParameter _PageID_W = null;

			public void WhereClauseReset()
			{
				_CategoryID_W = null;
				_TypeID_W = null;
				_Title_W = null;
				_IconPath_W = null;
				_PageID_W = null;

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
				
				
				public AggregateParameter CategoryID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CategoryID, Parameters.CategoryID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter TypeID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.TypeID, Parameters.TypeID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Title
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Title, Parameters.Title);
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

				public AggregateParameter PageID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PageID, Parameters.PageID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter CategoryID
		    {
				get
		        {
					if(_CategoryID_W == null)
	        	    {
						_CategoryID_W = TearOff.CategoryID;
					}
					return _CategoryID_W;
				}
			}

			public AggregateParameter TypeID
		    {
				get
		        {
					if(_TypeID_W == null)
	        	    {
						_TypeID_W = TearOff.TypeID;
					}
					return _TypeID_W;
				}
			}

			public AggregateParameter Title
		    {
				get
		        {
					if(_Title_W == null)
	        	    {
						_Title_W = TearOff.Title;
					}
					return _Title_W;
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

			public AggregateParameter PageID
		    {
				get
		        {
					if(_PageID_W == null)
	        	    {
						_PageID_W = TearOff.PageID;
					}
					return _PageID_W;
				}
			}

			private AggregateParameter _CategoryID_W = null;
			private AggregateParameter _TypeID_W = null;
			private AggregateParameter _Title_W = null;
			private AggregateParameter _IconPath_W = null;
			private AggregateParameter _PageID_W = null;

			public void AggregateClauseReset()
			{
				_CategoryID_W = null;
				_TypeID_W = null;
				_Title_W = null;
				_IconPath_W = null;
				_PageID_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CategoriesInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.CategoryID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CategoriesUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_CategoriesDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.CategoryID);
			p.SourceColumn = ColumnNames.CategoryID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.CategoryID);
			p.SourceColumn = ColumnNames.CategoryID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.TypeID);
			p.SourceColumn = ColumnNames.TypeID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Title);
			p.SourceColumn = ColumnNames.Title;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.IconPath);
			p.SourceColumn = ColumnNames.IconPath;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.PageID);
			p.SourceColumn = ColumnNames.PageID;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
