
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
	public abstract class _Clients : SqlClientEntity
	{
		public _Clients()
		{
			this.QuerySource = "Clients";
			this.MappingName = "Clients";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ClientsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int ClientID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ClientID, ClientID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ClientsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter ClientID
			{
				get
				{
					return new SqlParameter("@ClientID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ClientName
			{
				get
				{
					return new SqlParameter("@ClientName", SqlDbType.NVarChar, 300);
				}
			}
			
			public static SqlParameter ClientPhone
			{
				get
				{
					return new SqlParameter("@ClientPhone", SqlDbType.NVarChar, 50);
				}
			}
			
			public static SqlParameter ClientEmail
			{
				get
				{
					return new SqlParameter("@ClientEmail", SqlDbType.NVarChar, 300);
				}
			}
			
			public static SqlParameter ClientCode
			{
				get
				{
					return new SqlParameter("@ClientCode", SqlDbType.NVarChar, 300);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ClientID = "ClientID";
            public const string ClientName = "ClientName";
            public const string ClientPhone = "ClientPhone";
            public const string ClientEmail = "ClientEmail";
            public const string ClientCode = "ClientCode";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ClientID] = _Clients.PropertyNames.ClientID;
					ht[ClientName] = _Clients.PropertyNames.ClientName;
					ht[ClientPhone] = _Clients.PropertyNames.ClientPhone;
					ht[ClientEmail] = _Clients.PropertyNames.ClientEmail;
					ht[ClientCode] = _Clients.PropertyNames.ClientCode;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string ClientID = "ClientID";
            public const string ClientName = "ClientName";
            public const string ClientPhone = "ClientPhone";
            public const string ClientEmail = "ClientEmail";
            public const string ClientCode = "ClientCode";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ClientID] = _Clients.ColumnNames.ClientID;
					ht[ClientName] = _Clients.ColumnNames.ClientName;
					ht[ClientPhone] = _Clients.ColumnNames.ClientPhone;
					ht[ClientEmail] = _Clients.ColumnNames.ClientEmail;
					ht[ClientCode] = _Clients.ColumnNames.ClientCode;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string ClientID = "s_ClientID";
            public const string ClientName = "s_ClientName";
            public const string ClientPhone = "s_ClientPhone";
            public const string ClientEmail = "s_ClientEmail";
            public const string ClientCode = "s_ClientCode";

		}
		#endregion		
		
		#region Properties
	
		public virtual int ClientID
	    {
			get
	        {
				return base.Getint(ColumnNames.ClientID);
			}
			set
	        {
				base.Setint(ColumnNames.ClientID, value);
			}
		}

		public virtual string ClientName
	    {
			get
	        {
				return base.Getstring(ColumnNames.ClientName);
			}
			set
	        {
				base.Setstring(ColumnNames.ClientName, value);
			}
		}

		public virtual string ClientPhone
	    {
			get
	        {
				return base.Getstring(ColumnNames.ClientPhone);
			}
			set
	        {
				base.Setstring(ColumnNames.ClientPhone, value);
			}
		}

		public virtual string ClientEmail
	    {
			get
	        {
				return base.Getstring(ColumnNames.ClientEmail);
			}
			set
	        {
				base.Setstring(ColumnNames.ClientEmail, value);
			}
		}

		public virtual string ClientCode
	    {
			get
	        {
				return base.Getstring(ColumnNames.ClientCode);
			}
			set
	        {
				base.Setstring(ColumnNames.ClientCode, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_ClientID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ClientID) ? string.Empty : base.GetintAsString(ColumnNames.ClientID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ClientID);
				else
					this.ClientID = base.SetintAsString(ColumnNames.ClientID, value);
			}
		}

		public virtual string s_ClientName
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ClientName) ? string.Empty : base.GetstringAsString(ColumnNames.ClientName);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ClientName);
				else
					this.ClientName = base.SetstringAsString(ColumnNames.ClientName, value);
			}
		}

		public virtual string s_ClientPhone
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ClientPhone) ? string.Empty : base.GetstringAsString(ColumnNames.ClientPhone);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ClientPhone);
				else
					this.ClientPhone = base.SetstringAsString(ColumnNames.ClientPhone, value);
			}
		}

		public virtual string s_ClientEmail
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ClientEmail) ? string.Empty : base.GetstringAsString(ColumnNames.ClientEmail);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ClientEmail);
				else
					this.ClientEmail = base.SetstringAsString(ColumnNames.ClientEmail, value);
			}
		}

		public virtual string s_ClientCode
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ClientCode) ? string.Empty : base.GetstringAsString(ColumnNames.ClientCode);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ClientCode);
				else
					this.ClientCode = base.SetstringAsString(ColumnNames.ClientCode, value);
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
				
				
				public WhereParameter ClientID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ClientID, Parameters.ClientID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ClientName
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ClientName, Parameters.ClientName);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ClientPhone
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ClientPhone, Parameters.ClientPhone);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ClientEmail
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ClientEmail, Parameters.ClientEmail);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ClientCode
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ClientCode, Parameters.ClientCode);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter ClientID
		    {
				get
		        {
					if(_ClientID_W == null)
	        	    {
						_ClientID_W = TearOff.ClientID;
					}
					return _ClientID_W;
				}
			}

			public WhereParameter ClientName
		    {
				get
		        {
					if(_ClientName_W == null)
	        	    {
						_ClientName_W = TearOff.ClientName;
					}
					return _ClientName_W;
				}
			}

			public WhereParameter ClientPhone
		    {
				get
		        {
					if(_ClientPhone_W == null)
	        	    {
						_ClientPhone_W = TearOff.ClientPhone;
					}
					return _ClientPhone_W;
				}
			}

			public WhereParameter ClientEmail
		    {
				get
		        {
					if(_ClientEmail_W == null)
	        	    {
						_ClientEmail_W = TearOff.ClientEmail;
					}
					return _ClientEmail_W;
				}
			}

			public WhereParameter ClientCode
		    {
				get
		        {
					if(_ClientCode_W == null)
	        	    {
						_ClientCode_W = TearOff.ClientCode;
					}
					return _ClientCode_W;
				}
			}

			private WhereParameter _ClientID_W = null;
			private WhereParameter _ClientName_W = null;
			private WhereParameter _ClientPhone_W = null;
			private WhereParameter _ClientEmail_W = null;
			private WhereParameter _ClientCode_W = null;

			public void WhereClauseReset()
			{
				_ClientID_W = null;
				_ClientName_W = null;
				_ClientPhone_W = null;
				_ClientEmail_W = null;
				_ClientCode_W = null;

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
				
				
				public AggregateParameter ClientID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ClientID, Parameters.ClientID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ClientName
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ClientName, Parameters.ClientName);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ClientPhone
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ClientPhone, Parameters.ClientPhone);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ClientEmail
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ClientEmail, Parameters.ClientEmail);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ClientCode
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ClientCode, Parameters.ClientCode);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter ClientID
		    {
				get
		        {
					if(_ClientID_W == null)
	        	    {
						_ClientID_W = TearOff.ClientID;
					}
					return _ClientID_W;
				}
			}

			public AggregateParameter ClientName
		    {
				get
		        {
					if(_ClientName_W == null)
	        	    {
						_ClientName_W = TearOff.ClientName;
					}
					return _ClientName_W;
				}
			}

			public AggregateParameter ClientPhone
		    {
				get
		        {
					if(_ClientPhone_W == null)
	        	    {
						_ClientPhone_W = TearOff.ClientPhone;
					}
					return _ClientPhone_W;
				}
			}

			public AggregateParameter ClientEmail
		    {
				get
		        {
					if(_ClientEmail_W == null)
	        	    {
						_ClientEmail_W = TearOff.ClientEmail;
					}
					return _ClientEmail_W;
				}
			}

			public AggregateParameter ClientCode
		    {
				get
		        {
					if(_ClientCode_W == null)
	        	    {
						_ClientCode_W = TearOff.ClientCode;
					}
					return _ClientCode_W;
				}
			}

			private AggregateParameter _ClientID_W = null;
			private AggregateParameter _ClientName_W = null;
			private AggregateParameter _ClientPhone_W = null;
			private AggregateParameter _ClientEmail_W = null;
			private AggregateParameter _ClientCode_W = null;

			public void AggregateClauseReset()
			{
				_ClientID_W = null;
				_ClientName_W = null;
				_ClientPhone_W = null;
				_ClientEmail_W = null;
				_ClientCode_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ClientsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.ClientID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ClientsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ClientsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ClientID);
			p.SourceColumn = ColumnNames.ClientID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.ClientID);
			p.SourceColumn = ColumnNames.ClientID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ClientName);
			p.SourceColumn = ColumnNames.ClientName;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ClientPhone);
			p.SourceColumn = ColumnNames.ClientPhone;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ClientEmail);
			p.SourceColumn = ColumnNames.ClientEmail;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ClientCode);
			p.SourceColumn = ColumnNames.ClientCode;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
