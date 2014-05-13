
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
	public abstract class _Message : SqlClientEntity
	{
		public _Message()
		{
			this.QuerySource = "Message";
			this.MappingName = "Message";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_MessageLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int ID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ID, ID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_MessageLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter ID
			{
				get
				{
					return new SqlParameter("@ID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter SenderID
			{
				get
				{
					return new SqlParameter("@SenderID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Subject
			{
				get
				{
					return new SqlParameter("@Subject", SqlDbType.NVarChar, 1000);
				}
			}
			
			public static SqlParameter Body
			{
				get
				{
					return new SqlParameter("@Body", SqlDbType.NVarChar, 1073741823);
				}
			}
			
			public static SqlParameter ToMembers
			{
				get
				{
					return new SqlParameter("@ToMembers", SqlDbType.NVarChar, 1000);
				}
			}
			
			public static SqlParameter CreateDate
			{
				get
				{
					return new SqlParameter("@CreateDate", SqlDbType.DateTime, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ID = "ID";
            public const string SenderID = "SenderID";
            public const string Subject = "Subject";
            public const string Body = "Body";
            public const string ToMembers = "ToMembers";
            public const string CreateDate = "CreateDate";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ID] = _Message.PropertyNames.ID;
					ht[SenderID] = _Message.PropertyNames.SenderID;
					ht[Subject] = _Message.PropertyNames.Subject;
					ht[Body] = _Message.PropertyNames.Body;
					ht[ToMembers] = _Message.PropertyNames.ToMembers;
					ht[CreateDate] = _Message.PropertyNames.CreateDate;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string ID = "ID";
            public const string SenderID = "SenderID";
            public const string Subject = "Subject";
            public const string Body = "Body";
            public const string ToMembers = "ToMembers";
            public const string CreateDate = "CreateDate";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ID] = _Message.ColumnNames.ID;
					ht[SenderID] = _Message.ColumnNames.SenderID;
					ht[Subject] = _Message.ColumnNames.Subject;
					ht[Body] = _Message.ColumnNames.Body;
					ht[ToMembers] = _Message.ColumnNames.ToMembers;
					ht[CreateDate] = _Message.ColumnNames.CreateDate;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string ID = "s_ID";
            public const string SenderID = "s_SenderID";
            public const string Subject = "s_Subject";
            public const string Body = "s_Body";
            public const string ToMembers = "s_ToMembers";
            public const string CreateDate = "s_CreateDate";

		}
		#endregion		
		
		#region Properties
	
		public virtual int ID
	    {
			get
	        {
				return base.Getint(ColumnNames.ID);
			}
			set
	        {
				base.Setint(ColumnNames.ID, value);
			}
		}

		public virtual int SenderID
	    {
			get
	        {
				return base.Getint(ColumnNames.SenderID);
			}
			set
	        {
				base.Setint(ColumnNames.SenderID, value);
			}
		}

		public virtual string Subject
	    {
			get
	        {
				return base.Getstring(ColumnNames.Subject);
			}
			set
	        {
				base.Setstring(ColumnNames.Subject, value);
			}
		}

		public virtual string Body
	    {
			get
	        {
				return base.Getstring(ColumnNames.Body);
			}
			set
	        {
				base.Setstring(ColumnNames.Body, value);
			}
		}

		public virtual string ToMembers
	    {
			get
	        {
				return base.Getstring(ColumnNames.ToMembers);
			}
			set
	        {
				base.Setstring(ColumnNames.ToMembers, value);
			}
		}

		public virtual DateTime CreateDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.CreateDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.CreateDate, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_ID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ID) ? string.Empty : base.GetintAsString(ColumnNames.ID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ID);
				else
					this.ID = base.SetintAsString(ColumnNames.ID, value);
			}
		}

		public virtual string s_SenderID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.SenderID) ? string.Empty : base.GetintAsString(ColumnNames.SenderID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.SenderID);
				else
					this.SenderID = base.SetintAsString(ColumnNames.SenderID, value);
			}
		}

		public virtual string s_Subject
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Subject) ? string.Empty : base.GetstringAsString(ColumnNames.Subject);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Subject);
				else
					this.Subject = base.SetstringAsString(ColumnNames.Subject, value);
			}
		}

		public virtual string s_Body
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Body) ? string.Empty : base.GetstringAsString(ColumnNames.Body);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Body);
				else
					this.Body = base.SetstringAsString(ColumnNames.Body, value);
			}
		}

		public virtual string s_ToMembers
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ToMembers) ? string.Empty : base.GetstringAsString(ColumnNames.ToMembers);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ToMembers);
				else
					this.ToMembers = base.SetstringAsString(ColumnNames.ToMembers, value);
			}
		}

		public virtual string s_CreateDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CreateDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.CreateDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CreateDate);
				else
					this.CreateDate = base.SetDateTimeAsString(ColumnNames.CreateDate, value);
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
				
				
				public WhereParameter ID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ID, Parameters.ID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter SenderID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.SenderID, Parameters.SenderID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Subject
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Subject, Parameters.Subject);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Body
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Body, Parameters.Body);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ToMembers
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ToMembers, Parameters.ToMembers);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CreateDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CreateDate, Parameters.CreateDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter ID
		    {
				get
		        {
					if(_ID_W == null)
	        	    {
						_ID_W = TearOff.ID;
					}
					return _ID_W;
				}
			}

			public WhereParameter SenderID
		    {
				get
		        {
					if(_SenderID_W == null)
	        	    {
						_SenderID_W = TearOff.SenderID;
					}
					return _SenderID_W;
				}
			}

			public WhereParameter Subject
		    {
				get
		        {
					if(_Subject_W == null)
	        	    {
						_Subject_W = TearOff.Subject;
					}
					return _Subject_W;
				}
			}

			public WhereParameter Body
		    {
				get
		        {
					if(_Body_W == null)
	        	    {
						_Body_W = TearOff.Body;
					}
					return _Body_W;
				}
			}

			public WhereParameter ToMembers
		    {
				get
		        {
					if(_ToMembers_W == null)
	        	    {
						_ToMembers_W = TearOff.ToMembers;
					}
					return _ToMembers_W;
				}
			}

			public WhereParameter CreateDate
		    {
				get
		        {
					if(_CreateDate_W == null)
	        	    {
						_CreateDate_W = TearOff.CreateDate;
					}
					return _CreateDate_W;
				}
			}

			private WhereParameter _ID_W = null;
			private WhereParameter _SenderID_W = null;
			private WhereParameter _Subject_W = null;
			private WhereParameter _Body_W = null;
			private WhereParameter _ToMembers_W = null;
			private WhereParameter _CreateDate_W = null;

			public void WhereClauseReset()
			{
				_ID_W = null;
				_SenderID_W = null;
				_Subject_W = null;
				_Body_W = null;
				_ToMembers_W = null;
				_CreateDate_W = null;

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
				
				
				public AggregateParameter ID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ID, Parameters.ID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter SenderID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.SenderID, Parameters.SenderID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Subject
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Subject, Parameters.Subject);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Body
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Body, Parameters.Body);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ToMembers
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ToMembers, Parameters.ToMembers);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CreateDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CreateDate, Parameters.CreateDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter ID
		    {
				get
		        {
					if(_ID_W == null)
	        	    {
						_ID_W = TearOff.ID;
					}
					return _ID_W;
				}
			}

			public AggregateParameter SenderID
		    {
				get
		        {
					if(_SenderID_W == null)
	        	    {
						_SenderID_W = TearOff.SenderID;
					}
					return _SenderID_W;
				}
			}

			public AggregateParameter Subject
		    {
				get
		        {
					if(_Subject_W == null)
	        	    {
						_Subject_W = TearOff.Subject;
					}
					return _Subject_W;
				}
			}

			public AggregateParameter Body
		    {
				get
		        {
					if(_Body_W == null)
	        	    {
						_Body_W = TearOff.Body;
					}
					return _Body_W;
				}
			}

			public AggregateParameter ToMembers
		    {
				get
		        {
					if(_ToMembers_W == null)
	        	    {
						_ToMembers_W = TearOff.ToMembers;
					}
					return _ToMembers_W;
				}
			}

			public AggregateParameter CreateDate
		    {
				get
		        {
					if(_CreateDate_W == null)
	        	    {
						_CreateDate_W = TearOff.CreateDate;
					}
					return _CreateDate_W;
				}
			}

			private AggregateParameter _ID_W = null;
			private AggregateParameter _SenderID_W = null;
			private AggregateParameter _Subject_W = null;
			private AggregateParameter _Body_W = null;
			private AggregateParameter _ToMembers_W = null;
			private AggregateParameter _CreateDate_W = null;

			public void AggregateClauseReset()
			{
				_ID_W = null;
				_SenderID_W = null;
				_Subject_W = null;
				_Body_W = null;
				_ToMembers_W = null;
				_CreateDate_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MessageInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.ID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MessageUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_MessageDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ID);
			p.SourceColumn = ColumnNames.ID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.ID);
			p.SourceColumn = ColumnNames.ID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.SenderID);
			p.SourceColumn = ColumnNames.SenderID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Subject);
			p.SourceColumn = ColumnNames.Subject;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Body);
			p.SourceColumn = ColumnNames.Body;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ToMembers);
			p.SourceColumn = ColumnNames.ToMembers;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CreateDate);
			p.SourceColumn = ColumnNames.CreateDate;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
