
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
	public abstract class _News : SqlClientEntity
	{
		public _News()
		{
			this.QuerySource = "News";
			this.MappingName = "News";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_NewsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int NewsID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.NewsID, NewsID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_NewsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter NewsID
			{
				get
				{
					return new SqlParameter("@NewsID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter EnTitle
			{
				get
				{
					return new SqlParameter("@EnTitle", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter ArTitle
			{
				get
				{
					return new SqlParameter("@ArTitle", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter EnContent
			{
				get
				{
					return new SqlParameter("@EnContent", SqlDbType.NVarChar, 1073741823);
				}
			}
			
			public static SqlParameter ArContent
			{
				get
				{
					return new SqlParameter("@ArContent", SqlDbType.NVarChar, 1073741823);
				}
			}
			
			public static SqlParameter MainImagePath
			{
				get
				{
					return new SqlParameter("@MainImagePath", SqlDbType.NVarChar, 200);
				}
			}
			
			public static SqlParameter Description
			{
				get
				{
					return new SqlParameter("@Description", SqlDbType.NVarChar, 1000);
				}
			}
			
			public static SqlParameter PostedDate
			{
				get
				{
					return new SqlParameter("@PostedDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string NewsID = "NewsID";
            public const string EnTitle = "EnTitle";
            public const string ArTitle = "ArTitle";
            public const string EnContent = "EnContent";
            public const string ArContent = "ArContent";
            public const string MainImagePath = "MainImagePath";
            public const string Description = "Description";
            public const string PostedDate = "PostedDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[NewsID] = _News.PropertyNames.NewsID;
					ht[EnTitle] = _News.PropertyNames.EnTitle;
					ht[ArTitle] = _News.PropertyNames.ArTitle;
					ht[EnContent] = _News.PropertyNames.EnContent;
					ht[ArContent] = _News.PropertyNames.ArContent;
					ht[MainImagePath] = _News.PropertyNames.MainImagePath;
					ht[Description] = _News.PropertyNames.Description;
					ht[PostedDate] = _News.PropertyNames.PostedDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string NewsID = "NewsID";
            public const string EnTitle = "EnTitle";
            public const string ArTitle = "ArTitle";
            public const string EnContent = "EnContent";
            public const string ArContent = "ArContent";
            public const string MainImagePath = "MainImagePath";
            public const string Description = "Description";
            public const string PostedDate = "PostedDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[NewsID] = _News.ColumnNames.NewsID;
					ht[EnTitle] = _News.ColumnNames.EnTitle;
					ht[ArTitle] = _News.ColumnNames.ArTitle;
					ht[EnContent] = _News.ColumnNames.EnContent;
					ht[ArContent] = _News.ColumnNames.ArContent;
					ht[MainImagePath] = _News.ColumnNames.MainImagePath;
					ht[Description] = _News.ColumnNames.Description;
					ht[PostedDate] = _News.ColumnNames.PostedDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string NewsID = "s_NewsID";
            public const string EnTitle = "s_EnTitle";
            public const string ArTitle = "s_ArTitle";
            public const string EnContent = "s_EnContent";
            public const string ArContent = "s_ArContent";
            public const string MainImagePath = "s_MainImagePath";
            public const string Description = "s_Description";
            public const string PostedDate = "s_PostedDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int NewsID
	    {
			get
	        {
				return base.Getint(ColumnNames.NewsID);
			}
			set
	        {
				base.Setint(ColumnNames.NewsID, value);
			}
		}

		public virtual string EnTitle
	    {
			get
	        {
				return base.Getstring(ColumnNames.EnTitle);
			}
			set
	        {
				base.Setstring(ColumnNames.EnTitle, value);
			}
		}

		public virtual string ArTitle
	    {
			get
	        {
				return base.Getstring(ColumnNames.ArTitle);
			}
			set
	        {
				base.Setstring(ColumnNames.ArTitle, value);
			}
		}

		public virtual string EnContent
	    {
			get
	        {
				return base.Getstring(ColumnNames.EnContent);
			}
			set
	        {
				base.Setstring(ColumnNames.EnContent, value);
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

		public virtual string MainImagePath
	    {
			get
	        {
				return base.Getstring(ColumnNames.MainImagePath);
			}
			set
	        {
				base.Setstring(ColumnNames.MainImagePath, value);
			}
		}

		public virtual string Description
	    {
			get
	        {
				return base.Getstring(ColumnNames.Description);
			}
			set
	        {
				base.Setstring(ColumnNames.Description, value);
			}
		}

		public virtual DateTime PostedDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.PostedDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.PostedDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_NewsID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.NewsID) ? string.Empty : base.GetintAsString(ColumnNames.NewsID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.NewsID);
				else
					this.NewsID = base.SetintAsString(ColumnNames.NewsID, value);
			}
		}

		public virtual string s_EnTitle
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EnTitle) ? string.Empty : base.GetstringAsString(ColumnNames.EnTitle);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EnTitle);
				else
					this.EnTitle = base.SetstringAsString(ColumnNames.EnTitle, value);
			}
		}

		public virtual string s_ArTitle
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ArTitle) ? string.Empty : base.GetstringAsString(ColumnNames.ArTitle);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ArTitle);
				else
					this.ArTitle = base.SetstringAsString(ColumnNames.ArTitle, value);
			}
		}

		public virtual string s_EnContent
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EnContent) ? string.Empty : base.GetstringAsString(ColumnNames.EnContent);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EnContent);
				else
					this.EnContent = base.SetstringAsString(ColumnNames.EnContent, value);
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

		public virtual string s_MainImagePath
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.MainImagePath) ? string.Empty : base.GetstringAsString(ColumnNames.MainImagePath);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.MainImagePath);
				else
					this.MainImagePath = base.SetstringAsString(ColumnNames.MainImagePath, value);
			}
		}

		public virtual string s_Description
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Description) ? string.Empty : base.GetstringAsString(ColumnNames.Description);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Description);
				else
					this.Description = base.SetstringAsString(ColumnNames.Description, value);
			}
		}

		public virtual string s_PostedDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.PostedDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.PostedDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.PostedDate);
				else
					this.PostedDate = base.SetDateTimeAsString(ColumnNames.PostedDate, value);
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
				
				
				public WhereParameter NewsID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.NewsID, Parameters.NewsID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EnTitle
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EnTitle, Parameters.EnTitle);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ArTitle
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ArTitle, Parameters.ArTitle);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EnContent
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EnContent, Parameters.EnContent);
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

				public WhereParameter MainImagePath
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.MainImagePath, Parameters.MainImagePath);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Description
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter PostedDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.PostedDate, Parameters.PostedDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter NewsID
		    {
				get
		        {
					if(_NewsID_W == null)
	        	    {
						_NewsID_W = TearOff.NewsID;
					}
					return _NewsID_W;
				}
			}

			public WhereParameter EnTitle
		    {
				get
		        {
					if(_EnTitle_W == null)
	        	    {
						_EnTitle_W = TearOff.EnTitle;
					}
					return _EnTitle_W;
				}
			}

			public WhereParameter ArTitle
		    {
				get
		        {
					if(_ArTitle_W == null)
	        	    {
						_ArTitle_W = TearOff.ArTitle;
					}
					return _ArTitle_W;
				}
			}

			public WhereParameter EnContent
		    {
				get
		        {
					if(_EnContent_W == null)
	        	    {
						_EnContent_W = TearOff.EnContent;
					}
					return _EnContent_W;
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

			public WhereParameter MainImagePath
		    {
				get
		        {
					if(_MainImagePath_W == null)
	        	    {
						_MainImagePath_W = TearOff.MainImagePath;
					}
					return _MainImagePath_W;
				}
			}

			public WhereParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public WhereParameter PostedDate
		    {
				get
		        {
					if(_PostedDate_W == null)
	        	    {
						_PostedDate_W = TearOff.PostedDate;
					}
					return _PostedDate_W;
				}
			}

			private WhereParameter _NewsID_W = null;
			private WhereParameter _EnTitle_W = null;
			private WhereParameter _ArTitle_W = null;
			private WhereParameter _EnContent_W = null;
			private WhereParameter _ArContent_W = null;
			private WhereParameter _MainImagePath_W = null;
			private WhereParameter _Description_W = null;
			private WhereParameter _PostedDate_W = null;

			public void WhereClauseReset()
			{
				_NewsID_W = null;
				_EnTitle_W = null;
				_ArTitle_W = null;
				_EnContent_W = null;
				_ArContent_W = null;
				_MainImagePath_W = null;
				_Description_W = null;
				_PostedDate_W = null;

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
				
				
				public AggregateParameter NewsID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.NewsID, Parameters.NewsID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EnTitle
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EnTitle, Parameters.EnTitle);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ArTitle
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ArTitle, Parameters.ArTitle);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EnContent
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EnContent, Parameters.EnContent);
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

				public AggregateParameter MainImagePath
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.MainImagePath, Parameters.MainImagePath);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Description
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Description, Parameters.Description);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter PostedDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.PostedDate, Parameters.PostedDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter NewsID
		    {
				get
		        {
					if(_NewsID_W == null)
	        	    {
						_NewsID_W = TearOff.NewsID;
					}
					return _NewsID_W;
				}
			}

			public AggregateParameter EnTitle
		    {
				get
		        {
					if(_EnTitle_W == null)
	        	    {
						_EnTitle_W = TearOff.EnTitle;
					}
					return _EnTitle_W;
				}
			}

			public AggregateParameter ArTitle
		    {
				get
		        {
					if(_ArTitle_W == null)
	        	    {
						_ArTitle_W = TearOff.ArTitle;
					}
					return _ArTitle_W;
				}
			}

			public AggregateParameter EnContent
		    {
				get
		        {
					if(_EnContent_W == null)
	        	    {
						_EnContent_W = TearOff.EnContent;
					}
					return _EnContent_W;
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

			public AggregateParameter MainImagePath
		    {
				get
		        {
					if(_MainImagePath_W == null)
	        	    {
						_MainImagePath_W = TearOff.MainImagePath;
					}
					return _MainImagePath_W;
				}
			}

			public AggregateParameter Description
		    {
				get
		        {
					if(_Description_W == null)
	        	    {
						_Description_W = TearOff.Description;
					}
					return _Description_W;
				}
			}

			public AggregateParameter PostedDate
		    {
				get
		        {
					if(_PostedDate_W == null)
	        	    {
						_PostedDate_W = TearOff.PostedDate;
					}
					return _PostedDate_W;
				}
			}

			private AggregateParameter _NewsID_W = null;
			private AggregateParameter _EnTitle_W = null;
			private AggregateParameter _ArTitle_W = null;
			private AggregateParameter _EnContent_W = null;
			private AggregateParameter _ArContent_W = null;
			private AggregateParameter _MainImagePath_W = null;
			private AggregateParameter _Description_W = null;
			private AggregateParameter _PostedDate_W = null;

			public void AggregateClauseReset()
			{
				_NewsID_W = null;
				_EnTitle_W = null;
				_ArTitle_W = null;
				_EnContent_W = null;
				_ArContent_W = null;
				_MainImagePath_W = null;
				_Description_W = null;
				_PostedDate_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_NewsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.NewsID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_NewsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_NewsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.NewsID);
			p.SourceColumn = ColumnNames.NewsID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.NewsID);
			p.SourceColumn = ColumnNames.NewsID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.EnTitle);
			p.SourceColumn = ColumnNames.EnTitle;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ArTitle);
			p.SourceColumn = ColumnNames.ArTitle;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.EnContent);
			p.SourceColumn = ColumnNames.EnContent;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ArContent);
			p.SourceColumn = ColumnNames.ArContent;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.MainImagePath);
			p.SourceColumn = ColumnNames.MainImagePath;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Description);
			p.SourceColumn = ColumnNames.Description;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.PostedDate);
			p.SourceColumn = ColumnNames.PostedDate;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}