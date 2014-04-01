
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

namespace MHO.DAL
{
	public abstract class _ICD10_DirectDeathReason : SqlClientEntity
	{
		public _ICD10_DirectDeathReason()
		{
			this.QuerySource = "ICD10_DirectDeathReason";
			this.MappingName = "ICD10_DirectDeathReason";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ICD10_DirectDeathReasonLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey()
		{
			ListDictionary parameters = new ListDictionary();
					
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ICD10_DirectDeathReasonLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter DiagnosisCode
			{
				get
				{
					return new SqlParameter("@DiagnosisCode", SqlDbType.NVarChar, 255);
				}
			}
			
			public static SqlParameter DiagnosisEDesc
			{
				get
				{
					return new SqlParameter("@DiagnosisEDesc", SqlDbType.NVarChar, 255);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string DiagnosisCode = "DiagnosisCode";
            public const string DiagnosisEDesc = "DiagnosisEDesc";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[DiagnosisCode] = _ICD10_DirectDeathReason.PropertyNames.DiagnosisCode;
					ht[DiagnosisEDesc] = _ICD10_DirectDeathReason.PropertyNames.DiagnosisEDesc;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string DiagnosisCode = "DiagnosisCode";
            public const string DiagnosisEDesc = "DiagnosisEDesc";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[DiagnosisCode] = _ICD10_DirectDeathReason.ColumnNames.DiagnosisCode;
					ht[DiagnosisEDesc] = _ICD10_DirectDeathReason.ColumnNames.DiagnosisEDesc;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string DiagnosisCode = "s_DiagnosisCode";
            public const string DiagnosisEDesc = "s_DiagnosisEDesc";

		}
		#endregion		
		
		#region Properties
	
		public virtual string DiagnosisCode
	    {
			get
	        {
				return base.Getstring(ColumnNames.DiagnosisCode);
			}
			set
	        {
				base.Setstring(ColumnNames.DiagnosisCode, value);
			}
		}

		public virtual string DiagnosisEDesc
	    {
			get
	        {
				return base.Getstring(ColumnNames.DiagnosisEDesc);
			}
			set
	        {
				base.Setstring(ColumnNames.DiagnosisEDesc, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_DiagnosisCode
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DiagnosisCode) ? string.Empty : base.GetstringAsString(ColumnNames.DiagnosisCode);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DiagnosisCode);
				else
					this.DiagnosisCode = base.SetstringAsString(ColumnNames.DiagnosisCode, value);
			}
		}

		public virtual string s_DiagnosisEDesc
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DiagnosisEDesc) ? string.Empty : base.GetstringAsString(ColumnNames.DiagnosisEDesc);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DiagnosisEDesc);
				else
					this.DiagnosisEDesc = base.SetstringAsString(ColumnNames.DiagnosisEDesc, value);
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
				
				
				public WhereParameter DiagnosisCode
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DiagnosisCode, Parameters.DiagnosisCode);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter DiagnosisEDesc
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DiagnosisEDesc, Parameters.DiagnosisEDesc);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter DiagnosisCode
		    {
				get
		        {
					if(_DiagnosisCode_W == null)
	        	    {
						_DiagnosisCode_W = TearOff.DiagnosisCode;
					}
					return _DiagnosisCode_W;
				}
			}

			public WhereParameter DiagnosisEDesc
		    {
				get
		        {
					if(_DiagnosisEDesc_W == null)
	        	    {
						_DiagnosisEDesc_W = TearOff.DiagnosisEDesc;
					}
					return _DiagnosisEDesc_W;
				}
			}

			private WhereParameter _DiagnosisCode_W = null;
			private WhereParameter _DiagnosisEDesc_W = null;

			public void WhereClauseReset()
			{
				_DiagnosisCode_W = null;
				_DiagnosisEDesc_W = null;

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
				
				
				public AggregateParameter DiagnosisCode
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DiagnosisCode, Parameters.DiagnosisCode);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter DiagnosisEDesc
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DiagnosisEDesc, Parameters.DiagnosisEDesc);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter DiagnosisCode
		    {
				get
		        {
					if(_DiagnosisCode_W == null)
	        	    {
						_DiagnosisCode_W = TearOff.DiagnosisCode;
					}
					return _DiagnosisCode_W;
				}
			}

			public AggregateParameter DiagnosisEDesc
		    {
				get
		        {
					if(_DiagnosisEDesc_W == null)
	        	    {
						_DiagnosisEDesc_W = TearOff.DiagnosisEDesc;
					}
					return _DiagnosisEDesc_W;
				}
			}

			private AggregateParameter _DiagnosisCode_W = null;
			private AggregateParameter _DiagnosisEDesc_W = null;

			public void AggregateClauseReset()
			{
				_DiagnosisCode_W = null;
				_DiagnosisEDesc_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10_DirectDeathReasonInsert]";
	
			CreateParameters(cmd);
			    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10_DirectDeathReasonUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10_DirectDeathReasonDelete]";
	
			SqlParameter p;
  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.DiagnosisCode);
			p.SourceColumn = ColumnNames.DiagnosisCode;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.DiagnosisEDesc);
			p.SourceColumn = ColumnNames.DiagnosisEDesc;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}