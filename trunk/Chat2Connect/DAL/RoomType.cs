
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
	public abstract class _RoomType : SqlClientEntity
	{
		public _RoomType()
		{
			this.QuerySource = "RoomType";
			this.MappingName = "RoomType";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_RoomTypeLoadAll]", parameters);
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

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_RoomTypeLoadByPrimaryKey]", parameters);
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
			
			public static SqlParameter RoomID
			{
				get
				{
					return new SqlParameter("@RoomID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter RoomTypeSpecDurationID
			{
				get
				{
					return new SqlParameter("@RoomTypeSpecDurationID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter StartDate
			{
				get
				{
					return new SqlParameter("@StartDate", SqlDbType.DateTime, 0);
				}
			}
			
			public static SqlParameter EndDate
			{
				get
				{
					return new SqlParameter("@EndDate", SqlDbType.DateTime, 0);
				}
			}
			
			public static SqlParameter CreateBy
			{
				get
				{
					return new SqlParameter("@CreateBy", SqlDbType.Int, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ID = "ID";
            public const string RoomID = "RoomID";
            public const string RoomTypeSpecDurationID = "RoomTypeSpecDurationID";
            public const string StartDate = "StartDate";
            public const string EndDate = "EndDate";
            public const string CreateBy = "CreateBy";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ID] = _RoomType.PropertyNames.ID;
					ht[RoomID] = _RoomType.PropertyNames.RoomID;
					ht[RoomTypeSpecDurationID] = _RoomType.PropertyNames.RoomTypeSpecDurationID;
					ht[StartDate] = _RoomType.PropertyNames.StartDate;
					ht[EndDate] = _RoomType.PropertyNames.EndDate;
					ht[CreateBy] = _RoomType.PropertyNames.CreateBy;

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
            public const string RoomID = "RoomID";
            public const string RoomTypeSpecDurationID = "RoomTypeSpecDurationID";
            public const string StartDate = "StartDate";
            public const string EndDate = "EndDate";
            public const string CreateBy = "CreateBy";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ID] = _RoomType.ColumnNames.ID;
					ht[RoomID] = _RoomType.ColumnNames.RoomID;
					ht[RoomTypeSpecDurationID] = _RoomType.ColumnNames.RoomTypeSpecDurationID;
					ht[StartDate] = _RoomType.ColumnNames.StartDate;
					ht[EndDate] = _RoomType.ColumnNames.EndDate;
					ht[CreateBy] = _RoomType.ColumnNames.CreateBy;

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
            public const string RoomID = "s_RoomID";
            public const string RoomTypeSpecDurationID = "s_RoomTypeSpecDurationID";
            public const string StartDate = "s_StartDate";
            public const string EndDate = "s_EndDate";
            public const string CreateBy = "s_CreateBy";

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

		public virtual int RoomID
	    {
			get
	        {
				return base.Getint(ColumnNames.RoomID);
			}
			set
	        {
				base.Setint(ColumnNames.RoomID, value);
			}
		}

		public virtual int RoomTypeSpecDurationID
	    {
			get
	        {
				return base.Getint(ColumnNames.RoomTypeSpecDurationID);
			}
			set
	        {
				base.Setint(ColumnNames.RoomTypeSpecDurationID, value);
			}
		}

		public virtual DateTime StartDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.StartDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.StartDate, value);
			}
		}

		public virtual DateTime EndDate
	    {
			get
	        {
				return base.GetDateTime(ColumnNames.EndDate);
			}
			set
	        {
				base.SetDateTime(ColumnNames.EndDate, value);
			}
		}

		public virtual int CreateBy
	    {
			get
	        {
				return base.Getint(ColumnNames.CreateBy);
			}
			set
	        {
				base.Setint(ColumnNames.CreateBy, value);
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

		public virtual string s_RoomID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.RoomID) ? string.Empty : base.GetintAsString(ColumnNames.RoomID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.RoomID);
				else
					this.RoomID = base.SetintAsString(ColumnNames.RoomID, value);
			}
		}

		public virtual string s_RoomTypeSpecDurationID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.RoomTypeSpecDurationID) ? string.Empty : base.GetintAsString(ColumnNames.RoomTypeSpecDurationID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.RoomTypeSpecDurationID);
				else
					this.RoomTypeSpecDurationID = base.SetintAsString(ColumnNames.RoomTypeSpecDurationID, value);
			}
		}

		public virtual string s_StartDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.StartDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.StartDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.StartDate);
				else
					this.StartDate = base.SetDateTimeAsString(ColumnNames.StartDate, value);
			}
		}

		public virtual string s_EndDate
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.EndDate) ? string.Empty : base.GetDateTimeAsString(ColumnNames.EndDate);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.EndDate);
				else
					this.EndDate = base.SetDateTimeAsString(ColumnNames.EndDate, value);
			}
		}

		public virtual string s_CreateBy
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CreateBy) ? string.Empty : base.GetintAsString(ColumnNames.CreateBy);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CreateBy);
				else
					this.CreateBy = base.SetintAsString(ColumnNames.CreateBy, value);
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

				public WhereParameter RoomID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.RoomID, Parameters.RoomID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter RoomTypeSpecDurationID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.RoomTypeSpecDurationID, Parameters.RoomTypeSpecDurationID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter StartDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.StartDate, Parameters.StartDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter EndDate
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.EndDate, Parameters.EndDate);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CreateBy
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CreateBy, Parameters.CreateBy);
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

			public WhereParameter RoomID
		    {
				get
		        {
					if(_RoomID_W == null)
	        	    {
						_RoomID_W = TearOff.RoomID;
					}
					return _RoomID_W;
				}
			}

			public WhereParameter RoomTypeSpecDurationID
		    {
				get
		        {
					if(_RoomTypeSpecDurationID_W == null)
	        	    {
						_RoomTypeSpecDurationID_W = TearOff.RoomTypeSpecDurationID;
					}
					return _RoomTypeSpecDurationID_W;
				}
			}

			public WhereParameter StartDate
		    {
				get
		        {
					if(_StartDate_W == null)
	        	    {
						_StartDate_W = TearOff.StartDate;
					}
					return _StartDate_W;
				}
			}

			public WhereParameter EndDate
		    {
				get
		        {
					if(_EndDate_W == null)
	        	    {
						_EndDate_W = TearOff.EndDate;
					}
					return _EndDate_W;
				}
			}

			public WhereParameter CreateBy
		    {
				get
		        {
					if(_CreateBy_W == null)
	        	    {
						_CreateBy_W = TearOff.CreateBy;
					}
					return _CreateBy_W;
				}
			}

			private WhereParameter _ID_W = null;
			private WhereParameter _RoomID_W = null;
			private WhereParameter _RoomTypeSpecDurationID_W = null;
			private WhereParameter _StartDate_W = null;
			private WhereParameter _EndDate_W = null;
			private WhereParameter _CreateBy_W = null;

			public void WhereClauseReset()
			{
				_ID_W = null;
				_RoomID_W = null;
				_RoomTypeSpecDurationID_W = null;
				_StartDate_W = null;
				_EndDate_W = null;
				_CreateBy_W = null;

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

				public AggregateParameter RoomID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.RoomID, Parameters.RoomID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter RoomTypeSpecDurationID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.RoomTypeSpecDurationID, Parameters.RoomTypeSpecDurationID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter StartDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.StartDate, Parameters.StartDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter EndDate
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.EndDate, Parameters.EndDate);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CreateBy
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CreateBy, Parameters.CreateBy);
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

			public AggregateParameter RoomID
		    {
				get
		        {
					if(_RoomID_W == null)
	        	    {
						_RoomID_W = TearOff.RoomID;
					}
					return _RoomID_W;
				}
			}

			public AggregateParameter RoomTypeSpecDurationID
		    {
				get
		        {
					if(_RoomTypeSpecDurationID_W == null)
	        	    {
						_RoomTypeSpecDurationID_W = TearOff.RoomTypeSpecDurationID;
					}
					return _RoomTypeSpecDurationID_W;
				}
			}

			public AggregateParameter StartDate
		    {
				get
		        {
					if(_StartDate_W == null)
	        	    {
						_StartDate_W = TearOff.StartDate;
					}
					return _StartDate_W;
				}
			}

			public AggregateParameter EndDate
		    {
				get
		        {
					if(_EndDate_W == null)
	        	    {
						_EndDate_W = TearOff.EndDate;
					}
					return _EndDate_W;
				}
			}

			public AggregateParameter CreateBy
		    {
				get
		        {
					if(_CreateBy_W == null)
	        	    {
						_CreateBy_W = TearOff.CreateBy;
					}
					return _CreateBy_W;
				}
			}

			private AggregateParameter _ID_W = null;
			private AggregateParameter _RoomID_W = null;
			private AggregateParameter _RoomTypeSpecDurationID_W = null;
			private AggregateParameter _StartDate_W = null;
			private AggregateParameter _EndDate_W = null;
			private AggregateParameter _CreateBy_W = null;

			public void AggregateClauseReset()
			{
				_ID_W = null;
				_RoomID_W = null;
				_RoomTypeSpecDurationID_W = null;
				_StartDate_W = null;
				_EndDate_W = null;
				_CreateBy_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_RoomTypeInsert]";
	
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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_RoomTypeUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_RoomTypeDelete]";
	
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

			p = cmd.Parameters.Add(Parameters.RoomID);
			p.SourceColumn = ColumnNames.RoomID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.RoomTypeSpecDurationID);
			p.SourceColumn = ColumnNames.RoomTypeSpecDurationID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.StartDate);
			p.SourceColumn = ColumnNames.StartDate;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.EndDate);
			p.SourceColumn = ColumnNames.EndDate;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CreateBy);
			p.SourceColumn = ColumnNames.CreateBy;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
