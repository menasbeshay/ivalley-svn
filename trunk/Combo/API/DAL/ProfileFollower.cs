
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
	public abstract class _ProfileFollower : SqlClientEntity
	{
		public _ProfileFollower()
		{
			this.QuerySource = "ProfileFollower";
			this.MappingName = "ProfileFollower";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ProfileFollowerLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int ComboUserID, int ComboFollowerID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ComboUserID, ComboUserID);

parameters.Add(Parameters.ComboFollowerID, ComboFollowerID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ProfileFollowerLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter ComboUserID
			{
				get
				{
					return new SqlParameter("@ComboUserID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ComboFollowerID
			{
				get
				{
					return new SqlParameter("@ComboFollowerID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter IsRequestApproved
			{
				get
				{
					return new SqlParameter("@IsRequestApproved", SqlDbType.Bit, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string ComboUserID = "ComboUserID";
            public const string ComboFollowerID = "ComboFollowerID";
            public const string IsRequestApproved = "IsRequestApproved";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ComboUserID] = _ProfileFollower.PropertyNames.ComboUserID;
					ht[ComboFollowerID] = _ProfileFollower.PropertyNames.ComboFollowerID;
					ht[IsRequestApproved] = _ProfileFollower.PropertyNames.IsRequestApproved;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string ComboUserID = "ComboUserID";
            public const string ComboFollowerID = "ComboFollowerID";
            public const string IsRequestApproved = "IsRequestApproved";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[ComboUserID] = _ProfileFollower.ColumnNames.ComboUserID;
					ht[ComboFollowerID] = _ProfileFollower.ColumnNames.ComboFollowerID;
					ht[IsRequestApproved] = _ProfileFollower.ColumnNames.IsRequestApproved;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string ComboUserID = "s_ComboUserID";
            public const string ComboFollowerID = "s_ComboFollowerID";
            public const string IsRequestApproved = "s_IsRequestApproved";

		}
		#endregion		
		
		#region Properties
	
		public virtual int ComboUserID
	    {
			get
	        {
				return base.Getint(ColumnNames.ComboUserID);
			}
			set
	        {
				base.Setint(ColumnNames.ComboUserID, value);
			}
		}

		public virtual int ComboFollowerID
	    {
			get
	        {
				return base.Getint(ColumnNames.ComboFollowerID);
			}
			set
	        {
				base.Setint(ColumnNames.ComboFollowerID, value);
			}
		}

		public virtual bool IsRequestApproved
	    {
			get
	        {
				return base.Getbool(ColumnNames.IsRequestApproved);
			}
			set
	        {
				base.Setbool(ColumnNames.IsRequestApproved, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_ComboUserID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ComboUserID) ? string.Empty : base.GetintAsString(ColumnNames.ComboUserID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ComboUserID);
				else
					this.ComboUserID = base.SetintAsString(ColumnNames.ComboUserID, value);
			}
		}

		public virtual string s_ComboFollowerID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ComboFollowerID) ? string.Empty : base.GetintAsString(ColumnNames.ComboFollowerID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ComboFollowerID);
				else
					this.ComboFollowerID = base.SetintAsString(ColumnNames.ComboFollowerID, value);
			}
		}

		public virtual string s_IsRequestApproved
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.IsRequestApproved) ? string.Empty : base.GetboolAsString(ColumnNames.IsRequestApproved);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.IsRequestApproved);
				else
					this.IsRequestApproved = base.SetboolAsString(ColumnNames.IsRequestApproved, value);
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
				
				
				public WhereParameter ComboUserID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ComboUserID, Parameters.ComboUserID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ComboFollowerID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ComboFollowerID, Parameters.ComboFollowerID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter IsRequestApproved
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.IsRequestApproved, Parameters.IsRequestApproved);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter ComboUserID
		    {
				get
		        {
					if(_ComboUserID_W == null)
	        	    {
						_ComboUserID_W = TearOff.ComboUserID;
					}
					return _ComboUserID_W;
				}
			}

			public WhereParameter ComboFollowerID
		    {
				get
		        {
					if(_ComboFollowerID_W == null)
	        	    {
						_ComboFollowerID_W = TearOff.ComboFollowerID;
					}
					return _ComboFollowerID_W;
				}
			}

			public WhereParameter IsRequestApproved
		    {
				get
		        {
					if(_IsRequestApproved_W == null)
	        	    {
						_IsRequestApproved_W = TearOff.IsRequestApproved;
					}
					return _IsRequestApproved_W;
				}
			}

			private WhereParameter _ComboUserID_W = null;
			private WhereParameter _ComboFollowerID_W = null;
			private WhereParameter _IsRequestApproved_W = null;

			public void WhereClauseReset()
			{
				_ComboUserID_W = null;
				_ComboFollowerID_W = null;
				_IsRequestApproved_W = null;

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
				
				
				public AggregateParameter ComboUserID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ComboUserID, Parameters.ComboUserID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ComboFollowerID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ComboFollowerID, Parameters.ComboFollowerID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter IsRequestApproved
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.IsRequestApproved, Parameters.IsRequestApproved);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter ComboUserID
		    {
				get
		        {
					if(_ComboUserID_W == null)
	        	    {
						_ComboUserID_W = TearOff.ComboUserID;
					}
					return _ComboUserID_W;
				}
			}

			public AggregateParameter ComboFollowerID
		    {
				get
		        {
					if(_ComboFollowerID_W == null)
	        	    {
						_ComboFollowerID_W = TearOff.ComboFollowerID;
					}
					return _ComboFollowerID_W;
				}
			}

			public AggregateParameter IsRequestApproved
		    {
				get
		        {
					if(_IsRequestApproved_W == null)
	        	    {
						_IsRequestApproved_W = TearOff.IsRequestApproved;
					}
					return _IsRequestApproved_W;
				}
			}

			private AggregateParameter _ComboUserID_W = null;
			private AggregateParameter _ComboFollowerID_W = null;
			private AggregateParameter _IsRequestApproved_W = null;

			public void AggregateClauseReset()
			{
				_ComboUserID_W = null;
				_ComboFollowerID_W = null;
				_IsRequestApproved_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ProfileFollowerInsert]";
	
			CreateParameters(cmd);
			    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ProfileFollowerUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ProfileFollowerDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ComboUserID);
			p.SourceColumn = ColumnNames.ComboUserID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ComboFollowerID);
			p.SourceColumn = ColumnNames.ComboFollowerID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.ComboUserID);
			p.SourceColumn = ColumnNames.ComboUserID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ComboFollowerID);
			p.SourceColumn = ColumnNames.ComboFollowerID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.IsRequestApproved);
			p.SourceColumn = ColumnNames.IsRequestApproved;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
