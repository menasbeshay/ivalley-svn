
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

namespace ITravel.DAL
{
	public abstract class _TicketStatus : SqlClientEntity
	{
		public _TicketStatus()
		{
			this.QuerySource = "TicketStatus";
			this.MappingName = "TicketStatus";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_TicketStatusLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int TicketStatusID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.TicketStatusID, TicketStatusID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_TicketStatusLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter TicketStatusID
			{
				get
				{
					return new SqlParameter("@TicketStatusID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ArName
			{
				get
				{
					return new SqlParameter("@ArName", SqlDbType.NVarChar, 40);
				}
			}
			
			public static SqlParameter EnName
			{
				get
				{
					return new SqlParameter("@EnName", SqlDbType.NVarChar, 40);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string TicketStatusID = "TicketStatusID";
            public const string ArName = "ArName";
            public const string EnName = "EnName";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[TicketStatusID] = _TicketStatus.PropertyNames.TicketStatusID;
					ht[ArName] = _TicketStatus.PropertyNames.ArName;
					ht[EnName] = _TicketStatus.PropertyNames.EnName;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string TicketStatusID = "TicketStatusID";
            public const string ArName = "ArName";
            public const string EnName = "EnName";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[TicketStatusID] = _TicketStatus.ColumnNames.TicketStatusID;
					ht[ArName] = _TicketStatus.ColumnNames.ArName;
					ht[EnName] = _TicketStatus.ColumnNames.EnName;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string TicketStatusID = "s_TicketStatusID";
            public const string ArName = "s_ArName";
            public const string EnName = "s_EnName";

		}
		#endregion		
		
		#region Properties
	
		public virtual int TicketStatusID
	    {
			get
	        {
				return base.Getint(ColumnNames.TicketStatusID);
			}
			set
	        {
				base.Setint(ColumnNames.TicketStatusID, value);
			}
		}

		public virtual string ArName
	    {
			get
	        {
				return base.Getstring(ColumnNames.ArName);
			}
			set
	        {
				base.Setstring(ColumnNames.ArName, value);
			}
		}

		public virtual string EnName
	    {
			get
	        {
				return base.Getstring(ColumnNames.EnName);
			}
			set
	        {
				base.Setstring(ColumnNames.EnName, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_TicketStatusID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.TicketStatusID) ? string.Empty : base.GetintAsString(ColumnNames.TicketStatusID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.TicketStatusID);
				else
					this.TicketStatusID = base.SetintAsString(ColumnNames.TicketStatusID, value);
			}
		}

		public virtual string s_ArName
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ArName) ? string.Empty : base.GetstringAsString(ColumnNames.ArName);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ArName);
				else
					this.ArName = base.SetstringAsString(ColumnNames.ArName, value);
			}
		}

		public virtual string s_EnName
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EnName) ? string.Empty : base.GetstringAsString(ColumnNames.EnName);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EnName);
				else
					this.EnName = base.SetstringAsString(ColumnNames.EnName, value);
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
				
				
				public WhereParameter TicketStatusID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.TicketStatusID, Parameters.TicketStatusID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ArName
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ArName, Parameters.ArName);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EnName
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EnName, Parameters.EnName);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter TicketStatusID
		    {
				get
		        {
					if(_TicketStatusID_W == null)
	        	    {
						_TicketStatusID_W = TearOff.TicketStatusID;
					}
					return _TicketStatusID_W;
				}
			}

			public WhereParameter ArName
		    {
				get
		        {
					if(_ArName_W == null)
	        	    {
						_ArName_W = TearOff.ArName;
					}
					return _ArName_W;
				}
			}

			public WhereParameter EnName
		    {
				get
		        {
					if(_EnName_W == null)
	        	    {
						_EnName_W = TearOff.EnName;
					}
					return _EnName_W;
				}
			}

			private WhereParameter _TicketStatusID_W = null;
			private WhereParameter _ArName_W = null;
			private WhereParameter _EnName_W = null;

			public void WhereClauseReset()
			{
				_TicketStatusID_W = null;
				_ArName_W = null;
				_EnName_W = null;

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
				
				
				public AggregateParameter TicketStatusID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.TicketStatusID, Parameters.TicketStatusID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ArName
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ArName, Parameters.ArName);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EnName
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EnName, Parameters.EnName);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter TicketStatusID
		    {
				get
		        {
					if(_TicketStatusID_W == null)
	        	    {
						_TicketStatusID_W = TearOff.TicketStatusID;
					}
					return _TicketStatusID_W;
				}
			}

			public AggregateParameter ArName
		    {
				get
		        {
					if(_ArName_W == null)
	        	    {
						_ArName_W = TearOff.ArName;
					}
					return _ArName_W;
				}
			}

			public AggregateParameter EnName
		    {
				get
		        {
					if(_EnName_W == null)
	        	    {
						_EnName_W = TearOff.EnName;
					}
					return _EnName_W;
				}
			}

			private AggregateParameter _TicketStatusID_W = null;
			private AggregateParameter _ArName_W = null;
			private AggregateParameter _EnName_W = null;

			public void AggregateClauseReset()
			{
				_TicketStatusID_W = null;
				_ArName_W = null;
				_EnName_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_TicketStatusInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.TicketStatusID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_TicketStatusUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_TicketStatusDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.TicketStatusID);
			p.SourceColumn = ColumnNames.TicketStatusID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.TicketStatusID);
			p.SourceColumn = ColumnNames.TicketStatusID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ArName);
			p.SourceColumn = ColumnNames.ArName;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.EnName);
			p.SourceColumn = ColumnNames.EnName;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
