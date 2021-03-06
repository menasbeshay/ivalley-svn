
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

namespace GlobalLogistics.DAL
{
	public abstract class _ShippingLines : SqlClientEntity
	{
		public _ShippingLines()
		{
			this.QuerySource = "ShippingLines";
			this.MappingName = "ShippingLines";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ShippingLinesLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int ShippingLinesID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ShippingLinesID, ShippingLinesID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ShippingLinesLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter ShippingLinesID
			{
				get
				{
					return new SqlParameter("@ShippingLinesID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter FromSeaPortID
			{
				get
				{
					return new SqlParameter("@FromSeaPortID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ToSeaPortID
			{
				get
				{
					return new SqlParameter("@ToSeaPortID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter CompanyID
			{
				get
				{
					return new SqlParameter("@CompanyID", SqlDbType.Int, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ShippingLinesID = "ShippingLinesID";
            public const string FromSeaPortID = "FromSeaPortID";
            public const string ToSeaPortID = "ToSeaPortID";
            public const string CompanyID = "CompanyID";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ShippingLinesID] = _ShippingLines.PropertyNames.ShippingLinesID;
					ht[FromSeaPortID] = _ShippingLines.PropertyNames.FromSeaPortID;
					ht[ToSeaPortID] = _ShippingLines.PropertyNames.ToSeaPortID;
					ht[CompanyID] = _ShippingLines.PropertyNames.CompanyID;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string ShippingLinesID = "ShippingLinesID";
            public const string FromSeaPortID = "FromSeaPortID";
            public const string ToSeaPortID = "ToSeaPortID";
            public const string CompanyID = "CompanyID";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ShippingLinesID] = _ShippingLines.ColumnNames.ShippingLinesID;
					ht[FromSeaPortID] = _ShippingLines.ColumnNames.FromSeaPortID;
					ht[ToSeaPortID] = _ShippingLines.ColumnNames.ToSeaPortID;
					ht[CompanyID] = _ShippingLines.ColumnNames.CompanyID;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string ShippingLinesID = "s_ShippingLinesID";
            public const string FromSeaPortID = "s_FromSeaPortID";
            public const string ToSeaPortID = "s_ToSeaPortID";
            public const string CompanyID = "s_CompanyID";

		}
		#endregion		
		
		#region Properties
	
		public virtual int ShippingLinesID
	    {
			get
	        {
				return base.Getint(ColumnNames.ShippingLinesID);
			}
			set
	        {
				base.Setint(ColumnNames.ShippingLinesID, value);
			}
		}

		public virtual int FromSeaPortID
	    {
			get
	        {
				return base.Getint(ColumnNames.FromSeaPortID);
			}
			set
	        {
				base.Setint(ColumnNames.FromSeaPortID, value);
			}
		}

		public virtual int ToSeaPortID
	    {
			get
	        {
				return base.Getint(ColumnNames.ToSeaPortID);
			}
			set
	        {
				base.Setint(ColumnNames.ToSeaPortID, value);
			}
		}

		public virtual int CompanyID
	    {
			get
	        {
				return base.Getint(ColumnNames.CompanyID);
			}
			set
	        {
				base.Setint(ColumnNames.CompanyID, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_ShippingLinesID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ShippingLinesID) ? string.Empty : base.GetintAsString(ColumnNames.ShippingLinesID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ShippingLinesID);
				else
					this.ShippingLinesID = base.SetintAsString(ColumnNames.ShippingLinesID, value);
			}
		}

		public virtual string s_FromSeaPortID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.FromSeaPortID) ? string.Empty : base.GetintAsString(ColumnNames.FromSeaPortID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.FromSeaPortID);
				else
					this.FromSeaPortID = base.SetintAsString(ColumnNames.FromSeaPortID, value);
			}
		}

		public virtual string s_ToSeaPortID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ToSeaPortID) ? string.Empty : base.GetintAsString(ColumnNames.ToSeaPortID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ToSeaPortID);
				else
					this.ToSeaPortID = base.SetintAsString(ColumnNames.ToSeaPortID, value);
			}
		}

		public virtual string s_CompanyID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CompanyID) ? string.Empty : base.GetintAsString(ColumnNames.CompanyID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CompanyID);
				else
					this.CompanyID = base.SetintAsString(ColumnNames.CompanyID, value);
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
				
				
				public WhereParameter ShippingLinesID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ShippingLinesID, Parameters.ShippingLinesID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter FromSeaPortID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.FromSeaPortID, Parameters.FromSeaPortID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ToSeaPortID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ToSeaPortID, Parameters.ToSeaPortID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CompanyID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CompanyID, Parameters.CompanyID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter ShippingLinesID
		    {
				get
		        {
					if(_ShippingLinesID_W == null)
	        	    {
						_ShippingLinesID_W = TearOff.ShippingLinesID;
					}
					return _ShippingLinesID_W;
				}
			}

			public WhereParameter FromSeaPortID
		    {
				get
		        {
					if(_FromSeaPortID_W == null)
	        	    {
						_FromSeaPortID_W = TearOff.FromSeaPortID;
					}
					return _FromSeaPortID_W;
				}
			}

			public WhereParameter ToSeaPortID
		    {
				get
		        {
					if(_ToSeaPortID_W == null)
	        	    {
						_ToSeaPortID_W = TearOff.ToSeaPortID;
					}
					return _ToSeaPortID_W;
				}
			}

			public WhereParameter CompanyID
		    {
				get
		        {
					if(_CompanyID_W == null)
	        	    {
						_CompanyID_W = TearOff.CompanyID;
					}
					return _CompanyID_W;
				}
			}

			private WhereParameter _ShippingLinesID_W = null;
			private WhereParameter _FromSeaPortID_W = null;
			private WhereParameter _ToSeaPortID_W = null;
			private WhereParameter _CompanyID_W = null;

			public void WhereClauseReset()
			{
				_ShippingLinesID_W = null;
				_FromSeaPortID_W = null;
				_ToSeaPortID_W = null;
				_CompanyID_W = null;

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
				
				
				public AggregateParameter ShippingLinesID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ShippingLinesID, Parameters.ShippingLinesID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter FromSeaPortID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.FromSeaPortID, Parameters.FromSeaPortID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ToSeaPortID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ToSeaPortID, Parameters.ToSeaPortID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CompanyID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CompanyID, Parameters.CompanyID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter ShippingLinesID
		    {
				get
		        {
					if(_ShippingLinesID_W == null)
	        	    {
						_ShippingLinesID_W = TearOff.ShippingLinesID;
					}
					return _ShippingLinesID_W;
				}
			}

			public AggregateParameter FromSeaPortID
		    {
				get
		        {
					if(_FromSeaPortID_W == null)
	        	    {
						_FromSeaPortID_W = TearOff.FromSeaPortID;
					}
					return _FromSeaPortID_W;
				}
			}

			public AggregateParameter ToSeaPortID
		    {
				get
		        {
					if(_ToSeaPortID_W == null)
	        	    {
						_ToSeaPortID_W = TearOff.ToSeaPortID;
					}
					return _ToSeaPortID_W;
				}
			}

			public AggregateParameter CompanyID
		    {
				get
		        {
					if(_CompanyID_W == null)
	        	    {
						_CompanyID_W = TearOff.CompanyID;
					}
					return _CompanyID_W;
				}
			}

			private AggregateParameter _ShippingLinesID_W = null;
			private AggregateParameter _FromSeaPortID_W = null;
			private AggregateParameter _ToSeaPortID_W = null;
			private AggregateParameter _CompanyID_W = null;

			public void AggregateClauseReset()
			{
				_ShippingLinesID_W = null;
				_FromSeaPortID_W = null;
				_ToSeaPortID_W = null;
				_CompanyID_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ShippingLinesInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.ShippingLinesID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ShippingLinesUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ShippingLinesDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ShippingLinesID);
			p.SourceColumn = ColumnNames.ShippingLinesID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.ShippingLinesID);
			p.SourceColumn = ColumnNames.ShippingLinesID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.FromSeaPortID);
			p.SourceColumn = ColumnNames.FromSeaPortID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ToSeaPortID);
			p.SourceColumn = ColumnNames.ToSeaPortID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CompanyID);
			p.SourceColumn = ColumnNames.CompanyID;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
