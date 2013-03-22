
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

// Generated by MyGeneration Version # (1.2.0.7)

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace MHO.DAL
{
	public abstract class _ICD10CODE : SqlClientEntity
	{
		public _ICD10CODE()
		{
			this.QuerySource = "ICD10CODE";
			this.MappingName = "ICD10CODE";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ICD10CODELoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(string ICDCODEID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.ICDCODEID, ICDCODEID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_ICD10CODELoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter FK_ITEMID
			{
				get
				{
					return new SqlParameter("@FK_ITEMID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter ICDCODEID
			{
				get
				{
					return new SqlParameter("@ICDCODEID", SqlDbType.Char, 20);
				}
			}
			
			public static SqlParameter CODEDESCREN
			{
				get
				{
					return new SqlParameter("@CODEDESCREN", SqlDbType.Char, 150);
				}
			}
			
			public static SqlParameter CODEDESCRAR
			{
				get
				{
					return new SqlParameter("@CODEDESCRAR", SqlDbType.Char, 150);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string FK_ITEMID = "FK_ITEMID";
            public const string ICDCODEID = "ICDCODEID";
            public const string CODEDESCREN = "CODEDESCREN";
            public const string CODEDESCRAR = "CODEDESCRAR";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[FK_ITEMID] = _ICD10CODE.PropertyNames.FK_ITEMID;
					ht[ICDCODEID] = _ICD10CODE.PropertyNames.ICDCODEID;
					ht[CODEDESCREN] = _ICD10CODE.PropertyNames.CODEDESCREN;
					ht[CODEDESCRAR] = _ICD10CODE.PropertyNames.CODEDESCRAR;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string FK_ITEMID = "FK_ITEMID";
            public const string ICDCODEID = "ICDCODEID";
            public const string CODEDESCREN = "CODEDESCREN";
            public const string CODEDESCRAR = "CODEDESCRAR";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[FK_ITEMID] = _ICD10CODE.ColumnNames.FK_ITEMID;
					ht[ICDCODEID] = _ICD10CODE.ColumnNames.ICDCODEID;
					ht[CODEDESCREN] = _ICD10CODE.ColumnNames.CODEDESCREN;
					ht[CODEDESCRAR] = _ICD10CODE.ColumnNames.CODEDESCRAR;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string FK_ITEMID = "s_FK_ITEMID";
            public const string ICDCODEID = "s_ICDCODEID";
            public const string CODEDESCREN = "s_CODEDESCREN";
            public const string CODEDESCRAR = "s_CODEDESCRAR";

		}
		#endregion		
		
		#region Properties
	
		public virtual int FK_ITEMID
	    {
			get
	        {
				return base.Getint(ColumnNames.FK_ITEMID);
			}
			set
	        {
				base.Setint(ColumnNames.FK_ITEMID, value);
			}
		}

		public virtual string ICDCODEID
	    {
			get
	        {
				return base.Getstring(ColumnNames.ICDCODEID);
			}
			set
	        {
				base.Setstring(ColumnNames.ICDCODEID, value);
			}
		}

		public virtual string CODEDESCREN
	    {
			get
	        {
				return base.Getstring(ColumnNames.CODEDESCREN);
			}
			set
	        {
				base.Setstring(ColumnNames.CODEDESCREN, value);
			}
		}

		public virtual string CODEDESCRAR
	    {
			get
	        {
				return base.Getstring(ColumnNames.CODEDESCRAR);
			}
			set
	        {
				base.Setstring(ColumnNames.CODEDESCRAR, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_FK_ITEMID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.FK_ITEMID) ? string.Empty : base.GetintAsString(ColumnNames.FK_ITEMID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.FK_ITEMID);
				else
					this.FK_ITEMID = base.SetintAsString(ColumnNames.FK_ITEMID, value);
			}
		}

		public virtual string s_ICDCODEID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.ICDCODEID) ? string.Empty : base.GetstringAsString(ColumnNames.ICDCODEID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.ICDCODEID);
				else
					this.ICDCODEID = base.SetstringAsString(ColumnNames.ICDCODEID, value);
			}
		}

		public virtual string s_CODEDESCREN
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CODEDESCREN) ? string.Empty : base.GetstringAsString(ColumnNames.CODEDESCREN);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CODEDESCREN);
				else
					this.CODEDESCREN = base.SetstringAsString(ColumnNames.CODEDESCREN, value);
			}
		}

		public virtual string s_CODEDESCRAR
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.CODEDESCRAR) ? string.Empty : base.GetstringAsString(ColumnNames.CODEDESCRAR);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.CODEDESCRAR);
				else
					this.CODEDESCRAR = base.SetstringAsString(ColumnNames.CODEDESCRAR, value);
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
				
				
				public WhereParameter FK_ITEMID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.FK_ITEMID, Parameters.FK_ITEMID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter ICDCODEID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.ICDCODEID, Parameters.ICDCODEID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CODEDESCREN
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CODEDESCREN, Parameters.CODEDESCREN);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter CODEDESCRAR
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.CODEDESCRAR, Parameters.CODEDESCRAR);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter FK_ITEMID
		    {
				get
		        {
					if(_FK_ITEMID_W == null)
	        	    {
						_FK_ITEMID_W = TearOff.FK_ITEMID;
					}
					return _FK_ITEMID_W;
				}
			}

			public WhereParameter ICDCODEID
		    {
				get
		        {
					if(_ICDCODEID_W == null)
	        	    {
						_ICDCODEID_W = TearOff.ICDCODEID;
					}
					return _ICDCODEID_W;
				}
			}

			public WhereParameter CODEDESCREN
		    {
				get
		        {
					if(_CODEDESCREN_W == null)
	        	    {
						_CODEDESCREN_W = TearOff.CODEDESCREN;
					}
					return _CODEDESCREN_W;
				}
			}

			public WhereParameter CODEDESCRAR
		    {
				get
		        {
					if(_CODEDESCRAR_W == null)
	        	    {
						_CODEDESCRAR_W = TearOff.CODEDESCRAR;
					}
					return _CODEDESCRAR_W;
				}
			}

			private WhereParameter _FK_ITEMID_W = null;
			private WhereParameter _ICDCODEID_W = null;
			private WhereParameter _CODEDESCREN_W = null;
			private WhereParameter _CODEDESCRAR_W = null;

			public void WhereClauseReset()
			{
				_FK_ITEMID_W = null;
				_ICDCODEID_W = null;
				_CODEDESCREN_W = null;
				_CODEDESCRAR_W = null;

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
				
				
				public AggregateParameter FK_ITEMID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.FK_ITEMID, Parameters.FK_ITEMID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter ICDCODEID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.ICDCODEID, Parameters.ICDCODEID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CODEDESCREN
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CODEDESCREN, Parameters.CODEDESCREN);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter CODEDESCRAR
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.CODEDESCRAR, Parameters.CODEDESCRAR);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter FK_ITEMID
		    {
				get
		        {
					if(_FK_ITEMID_W == null)
	        	    {
						_FK_ITEMID_W = TearOff.FK_ITEMID;
					}
					return _FK_ITEMID_W;
				}
			}

			public AggregateParameter ICDCODEID
		    {
				get
		        {
					if(_ICDCODEID_W == null)
	        	    {
						_ICDCODEID_W = TearOff.ICDCODEID;
					}
					return _ICDCODEID_W;
				}
			}

			public AggregateParameter CODEDESCREN
		    {
				get
		        {
					if(_CODEDESCREN_W == null)
	        	    {
						_CODEDESCREN_W = TearOff.CODEDESCREN;
					}
					return _CODEDESCREN_W;
				}
			}

			public AggregateParameter CODEDESCRAR
		    {
				get
		        {
					if(_CODEDESCRAR_W == null)
	        	    {
						_CODEDESCRAR_W = TearOff.CODEDESCRAR;
					}
					return _CODEDESCRAR_W;
				}
			}

			private AggregateParameter _FK_ITEMID_W = null;
			private AggregateParameter _ICDCODEID_W = null;
			private AggregateParameter _CODEDESCREN_W = null;
			private AggregateParameter _CODEDESCRAR_W = null;

			public void AggregateClauseReset()
			{
				_FK_ITEMID_W = null;
				_ICDCODEID_W = null;
				_CODEDESCREN_W = null;
				_CODEDESCRAR_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10CODEInsert]";
	
			CreateParameters(cmd);
			    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10CODEUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_ICD10CODEDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.ICDCODEID);
			p.SourceColumn = ColumnNames.ICDCODEID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.FK_ITEMID);
			p.SourceColumn = ColumnNames.FK_ITEMID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.ICDCODEID);
			p.SourceColumn = ColumnNames.ICDCODEID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CODEDESCREN);
			p.SourceColumn = ColumnNames.CODEDESCREN;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.CODEDESCRAR);
			p.SourceColumn = ColumnNames.CODEDESCRAR;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}