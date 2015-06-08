
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

namespace Flight_DAL
{
	public abstract class _UsersNofications : SqlClientEntity
	{
		public _UsersNofications()
		{
			this.QuerySource = "UsersNofications";
			this.MappingName = "UsersNofications";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_UsersNoficationsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int UserNotificationID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.UserNotificationID, UserNotificationID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_UsersNoficationsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter UserNotificationID
			{
				get
				{
					return new SqlParameter("@UserNotificationID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter UserID
			{
				get
				{
					return new SqlParameter("@UserID", SqlDbType.UniqueIdentifier, 0);
				}
			}
			
			public static SqlParameter NotificationType
			{
				get
				{
					return new SqlParameter("@NotificationType", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter IsRead
			{
				get
				{
					return new SqlParameter("@IsRead", SqlDbType.Bit, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string UserNotificationID = "UserNotificationID";
            public const string UserID = "UserID";
            public const string NotificationType = "NotificationType";
            public const string IsRead = "IsRead";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UserNotificationID] = _UsersNofications.PropertyNames.UserNotificationID;
					ht[UserID] = _UsersNofications.PropertyNames.UserID;
					ht[NotificationType] = _UsersNofications.PropertyNames.NotificationType;
					ht[IsRead] = _UsersNofications.PropertyNames.IsRead;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string UserNotificationID = "UserNotificationID";
            public const string UserID = "UserID";
            public const string NotificationType = "NotificationType";
            public const string IsRead = "IsRead";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[UserNotificationID] = _UsersNofications.ColumnNames.UserNotificationID;
					ht[UserID] = _UsersNofications.ColumnNames.UserID;
					ht[NotificationType] = _UsersNofications.ColumnNames.NotificationType;
					ht[IsRead] = _UsersNofications.ColumnNames.IsRead;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string UserNotificationID = "s_UserNotificationID";
            public const string UserID = "s_UserID";
            public const string NotificationType = "s_NotificationType";
            public const string IsRead = "s_IsRead";

		}
		#endregion		
		
		#region Properties
	
		public virtual int UserNotificationID
	    {
			get
	        {
				return base.Getint(ColumnNames.UserNotificationID);
			}
			set
	        {
				base.Setint(ColumnNames.UserNotificationID, value);
			}
		}

		public virtual Guid UserID
	    {
			get
	        {
				return base.GetGuid(ColumnNames.UserID);
			}
			set
	        {
				base.SetGuid(ColumnNames.UserID, value);
			}
		}

		public virtual int NotificationType
	    {
			get
	        {
				return base.Getint(ColumnNames.NotificationType);
			}
			set
	        {
				base.Setint(ColumnNames.NotificationType, value);
			}
		}

		public virtual bool IsRead
	    {
			get
	        {
				return base.Getbool(ColumnNames.IsRead);
			}
			set
	        {
				base.Setbool(ColumnNames.IsRead, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_UserNotificationID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UserNotificationID) ? string.Empty : base.GetintAsString(ColumnNames.UserNotificationID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UserNotificationID);
				else
					this.UserNotificationID = base.SetintAsString(ColumnNames.UserNotificationID, value);
			}
		}

		public virtual string s_UserID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.UserID) ? string.Empty : base.GetGuidAsString(ColumnNames.UserID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.UserID);
				else
					this.UserID = base.SetGuidAsString(ColumnNames.UserID, value);
			}
		}

		public virtual string s_NotificationType
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.NotificationType) ? string.Empty : base.GetintAsString(ColumnNames.NotificationType);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.NotificationType);
				else
					this.NotificationType = base.SetintAsString(ColumnNames.NotificationType, value);
			}
		}

		public virtual string s_IsRead
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.IsRead) ? string.Empty : base.GetboolAsString(ColumnNames.IsRead);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.IsRead);
				else
					this.IsRead = base.SetboolAsString(ColumnNames.IsRead, value);
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
				
				
				public WhereParameter UserNotificationID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UserNotificationID, Parameters.UserNotificationID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter UserID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter NotificationType
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.NotificationType, Parameters.NotificationType);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter IsRead
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.IsRead, Parameters.IsRead);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter UserNotificationID
		    {
				get
		        {
					if(_UserNotificationID_W == null)
	        	    {
						_UserNotificationID_W = TearOff.UserNotificationID;
					}
					return _UserNotificationID_W;
				}
			}

			public WhereParameter UserID
		    {
				get
		        {
					if(_UserID_W == null)
	        	    {
						_UserID_W = TearOff.UserID;
					}
					return _UserID_W;
				}
			}

			public WhereParameter NotificationType
		    {
				get
		        {
					if(_NotificationType_W == null)
	        	    {
						_NotificationType_W = TearOff.NotificationType;
					}
					return _NotificationType_W;
				}
			}

			public WhereParameter IsRead
		    {
				get
		        {
					if(_IsRead_W == null)
	        	    {
						_IsRead_W = TearOff.IsRead;
					}
					return _IsRead_W;
				}
			}

			private WhereParameter _UserNotificationID_W = null;
			private WhereParameter _UserID_W = null;
			private WhereParameter _NotificationType_W = null;
			private WhereParameter _IsRead_W = null;

			public void WhereClauseReset()
			{
				_UserNotificationID_W = null;
				_UserID_W = null;
				_NotificationType_W = null;
				_IsRead_W = null;

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
				
				
				public AggregateParameter UserNotificationID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UserNotificationID, Parameters.UserNotificationID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter UserID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.UserID, Parameters.UserID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter NotificationType
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.NotificationType, Parameters.NotificationType);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter IsRead
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.IsRead, Parameters.IsRead);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter UserNotificationID
		    {
				get
		        {
					if(_UserNotificationID_W == null)
	        	    {
						_UserNotificationID_W = TearOff.UserNotificationID;
					}
					return _UserNotificationID_W;
				}
			}

			public AggregateParameter UserID
		    {
				get
		        {
					if(_UserID_W == null)
	        	    {
						_UserID_W = TearOff.UserID;
					}
					return _UserID_W;
				}
			}

			public AggregateParameter NotificationType
		    {
				get
		        {
					if(_NotificationType_W == null)
	        	    {
						_NotificationType_W = TearOff.NotificationType;
					}
					return _NotificationType_W;
				}
			}

			public AggregateParameter IsRead
		    {
				get
		        {
					if(_IsRead_W == null)
	        	    {
						_IsRead_W = TearOff.IsRead;
					}
					return _IsRead_W;
				}
			}

			private AggregateParameter _UserNotificationID_W = null;
			private AggregateParameter _UserID_W = null;
			private AggregateParameter _NotificationType_W = null;
			private AggregateParameter _IsRead_W = null;

			public void AggregateClauseReset()
			{
				_UserNotificationID_W = null;
				_UserID_W = null;
				_NotificationType_W = null;
				_IsRead_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_UsersNoficationsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.UserNotificationID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_UsersNoficationsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_UsersNoficationsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.UserNotificationID);
			p.SourceColumn = ColumnNames.UserNotificationID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.UserNotificationID);
			p.SourceColumn = ColumnNames.UserNotificationID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.UserID);
			p.SourceColumn = ColumnNames.UserID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.NotificationType);
			p.SourceColumn = ColumnNames.NotificationType;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.IsRead);
			p.SourceColumn = ColumnNames.IsRead;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
