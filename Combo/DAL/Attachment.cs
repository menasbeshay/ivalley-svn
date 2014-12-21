
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
	public abstract class _Attachment : SqlClientEntity
	{
		public _Attachment()
		{
			this.QuerySource = "Attachment";
			this.MappingName = "Attachment";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_AttachmentLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int AttachmentID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.AttachmentID, AttachmentID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_AttachmentLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter AttachmentID
			{
				get
				{
					return new SqlParameter("@AttachmentID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Path
			{
				get
				{
					return new SqlParameter("@Path", SqlDbType.NVarChar, 2000);
				}
			}
			
			public static SqlParameter AttachmentTypeID
			{
				get
				{
					return new SqlParameter("@AttachmentTypeID", SqlDbType.Int, 0);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string AttachmentID = "AttachmentID";
            public const string Path = "Path";
            public const string AttachmentTypeID = "AttachmentTypeID";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[AttachmentID] = _Attachment.PropertyNames.AttachmentID;
					ht[Path] = _Attachment.PropertyNames.Path;
					ht[AttachmentTypeID] = _Attachment.PropertyNames.AttachmentTypeID;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string AttachmentID = "AttachmentID";
            public const string Path = "Path";
            public const string AttachmentTypeID = "AttachmentTypeID";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[AttachmentID] = _Attachment.ColumnNames.AttachmentID;
					ht[Path] = _Attachment.ColumnNames.Path;
					ht[AttachmentTypeID] = _Attachment.ColumnNames.AttachmentTypeID;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string AttachmentID = "s_AttachmentID";
            public const string Path = "s_Path";
            public const string AttachmentTypeID = "s_AttachmentTypeID";

		}
		#endregion		
		
		#region Properties
	
		public virtual int AttachmentID
	    {
			get
	        {
				return base.Getint(ColumnNames.AttachmentID);
			}
			set
	        {
				base.Setint(ColumnNames.AttachmentID, value);
			}
		}

		public virtual string Path
	    {
			get
	        {
				return base.Getstring(ColumnNames.Path);
			}
			set
	        {
				base.Setstring(ColumnNames.Path, value);
			}
		}

		public virtual int AttachmentTypeID
	    {
			get
	        {
				return base.Getint(ColumnNames.AttachmentTypeID);
			}
			set
	        {
				base.Setint(ColumnNames.AttachmentTypeID, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_AttachmentID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.AttachmentID) ? string.Empty : base.GetintAsString(ColumnNames.AttachmentID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.AttachmentID);
				else
					this.AttachmentID = base.SetintAsString(ColumnNames.AttachmentID, value);
			}
		}

		public virtual string s_Path
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Path) ? string.Empty : base.GetstringAsString(ColumnNames.Path);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Path);
				else
					this.Path = base.SetstringAsString(ColumnNames.Path, value);
			}
		}

		public virtual string s_AttachmentTypeID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.AttachmentTypeID) ? string.Empty : base.GetintAsString(ColumnNames.AttachmentTypeID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.AttachmentTypeID);
				else
					this.AttachmentTypeID = base.SetintAsString(ColumnNames.AttachmentTypeID, value);
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
				
				
				public WhereParameter AttachmentID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.AttachmentID, Parameters.AttachmentID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Path
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Path, Parameters.Path);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter AttachmentTypeID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.AttachmentTypeID, Parameters.AttachmentTypeID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter AttachmentID
		    {
				get
		        {
					if(_AttachmentID_W == null)
	        	    {
						_AttachmentID_W = TearOff.AttachmentID;
					}
					return _AttachmentID_W;
				}
			}

			public WhereParameter Path
		    {
				get
		        {
					if(_Path_W == null)
	        	    {
						_Path_W = TearOff.Path;
					}
					return _Path_W;
				}
			}

			public WhereParameter AttachmentTypeID
		    {
				get
		        {
					if(_AttachmentTypeID_W == null)
	        	    {
						_AttachmentTypeID_W = TearOff.AttachmentTypeID;
					}
					return _AttachmentTypeID_W;
				}
			}

			private WhereParameter _AttachmentID_W = null;
			private WhereParameter _Path_W = null;
			private WhereParameter _AttachmentTypeID_W = null;

			public void WhereClauseReset()
			{
				_AttachmentID_W = null;
				_Path_W = null;
				_AttachmentTypeID_W = null;

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
				
				
				public AggregateParameter AttachmentID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.AttachmentID, Parameters.AttachmentID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Path
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Path, Parameters.Path);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter AttachmentTypeID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.AttachmentTypeID, Parameters.AttachmentTypeID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter AttachmentID
		    {
				get
		        {
					if(_AttachmentID_W == null)
	        	    {
						_AttachmentID_W = TearOff.AttachmentID;
					}
					return _AttachmentID_W;
				}
			}

			public AggregateParameter Path
		    {
				get
		        {
					if(_Path_W == null)
	        	    {
						_Path_W = TearOff.Path;
					}
					return _Path_W;
				}
			}

			public AggregateParameter AttachmentTypeID
		    {
				get
		        {
					if(_AttachmentTypeID_W == null)
	        	    {
						_AttachmentTypeID_W = TearOff.AttachmentTypeID;
					}
					return _AttachmentTypeID_W;
				}
			}

			private AggregateParameter _AttachmentID_W = null;
			private AggregateParameter _Path_W = null;
			private AggregateParameter _AttachmentTypeID_W = null;

			public void AggregateClauseReset()
			{
				_AttachmentID_W = null;
				_Path_W = null;
				_AttachmentTypeID_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_AttachmentInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.AttachmentID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_AttachmentUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_AttachmentDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.AttachmentID);
			p.SourceColumn = ColumnNames.AttachmentID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.AttachmentID);
			p.SourceColumn = ColumnNames.AttachmentID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Path);
			p.SourceColumn = ColumnNames.Path;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.AttachmentTypeID);
			p.SourceColumn = ColumnNames.AttachmentTypeID;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
