
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

namespace YMC.DAL
{
	public abstract class _Departements : SqlClientEntity
	{
		public _Departements()
		{
			this.QuerySource = "Departements";
			this.MappingName = "Departements";

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
			
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_DepartementsLoadAll]", parameters);
		}
	
		//=================================================================
		// public Overridable Function LoadByPrimaryKey()  As Boolean
		//=================================================================
		//  Loads a single row of via the primary key
		//=================================================================
		public virtual bool LoadByPrimaryKey(int DepartementID)
		{
			ListDictionary parameters = new ListDictionary();
			parameters.Add(Parameters.DepartementID, DepartementID);

		
			return base.LoadFromSql("[" + this.SchemaStoredProcedure + "proc_DepartementsLoadByPrimaryKey]", parameters);
		}
		
		#region Parameters
		protected class Parameters
		{
			
			public static SqlParameter DepartementID
			{
				get
				{
					return new SqlParameter("@DepartementID", SqlDbType.Int, 0);
				}
			}
			
			public static SqlParameter Name
			{
				get
				{
					return new SqlParameter("@Name", SqlDbType.NVarChar, 500);
				}
			}
			
			public static SqlParameter DetailsArabic
			{
				get
				{
					return new SqlParameter("@DetailsArabic", SqlDbType.Text, 2147483647);
				}
			}
			
			public static SqlParameter DetailsEnglish
			{
				get
				{
					return new SqlParameter("@DetailsEnglish", SqlDbType.Text, 2147483647);
				}
			}
			
			public static SqlParameter Notes
			{
				get
				{
					return new SqlParameter("@Notes", SqlDbType.NVarChar, 1073741823);
				}
			}
			
		}
		#endregion		
	
		#region ColumnNames
		public class ColumnNames
		{  
            public const string DepartementID = "DepartementID";
            public const string Name = "Name";
            public const string DetailsArabic = "DetailsArabic";
            public const string DetailsEnglish = "DetailsEnglish";
            public const string Notes = "Notes";

			static public string ToPropertyName(string columnName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[DepartementID] = _Departements.PropertyNames.DepartementID;
					ht[Name] = _Departements.PropertyNames.Name;
					ht[DetailsArabic] = _Departements.PropertyNames.DetailsArabic;
					ht[DetailsEnglish] = _Departements.PropertyNames.DetailsEnglish;
					ht[Notes] = _Departements.PropertyNames.Notes;

				}
				return (string)ht[columnName];
			}

			static private Hashtable ht = null;			 
		}
		#endregion
		
		#region PropertyNames
		public class PropertyNames
		{  
            public const string DepartementID = "DepartementID";
            public const string Name = "Name";
            public const string DetailsArabic = "DetailsArabic";
            public const string DetailsEnglish = "DetailsEnglish";
            public const string Notes = "Notes";

			static public string ToColumnName(string propertyName)
			{
				if(ht == null)
				{
					ht = new Hashtable();
					
					ht[DepartementID] = _Departements.ColumnNames.DepartementID;
					ht[Name] = _Departements.ColumnNames.Name;
					ht[DetailsArabic] = _Departements.ColumnNames.DetailsArabic;
					ht[DetailsEnglish] = _Departements.ColumnNames.DetailsEnglish;
					ht[Notes] = _Departements.ColumnNames.Notes;

				}
				return (string)ht[propertyName];
			}

			static private Hashtable ht = null;			 
		}			 
		#endregion	

		#region StringPropertyNames
		public class StringPropertyNames
		{  
            public const string DepartementID = "s_DepartementID";
            public const string Name = "s_Name";
            public const string DetailsArabic = "s_DetailsArabic";
            public const string DetailsEnglish = "s_DetailsEnglish";
            public const string Notes = "s_Notes";

		}
		#endregion		
		
		#region Properties
	
		public virtual int DepartementID
	    {
			get
	        {
				return base.Getint(ColumnNames.DepartementID);
			}
			set
	        {
				base.Setint(ColumnNames.DepartementID, value);
			}
		}

		public virtual string Name
	    {
			get
	        {
				return base.Getstring(ColumnNames.Name);
			}
			set
	        {
				base.Setstring(ColumnNames.Name, value);
			}
		}

		public virtual string DetailsArabic
	    {
			get
	        {
				return base.Getstring(ColumnNames.DetailsArabic);
			}
			set
	        {
				base.Setstring(ColumnNames.DetailsArabic, value);
			}
		}

		public virtual string DetailsEnglish
	    {
			get
	        {
				return base.Getstring(ColumnNames.DetailsEnglish);
			}
			set
	        {
				base.Setstring(ColumnNames.DetailsEnglish, value);
			}
		}

		public virtual string Notes
	    {
			get
	        {
				return base.Getstring(ColumnNames.Notes);
			}
			set
	        {
				base.Setstring(ColumnNames.Notes, value);
			}
		}


		#endregion
		
		#region String Properties
	
		public virtual string s_DepartementID
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DepartementID) ? string.Empty : base.GetintAsString(ColumnNames.DepartementID);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DepartementID);
				else
					this.DepartementID = base.SetintAsString(ColumnNames.DepartementID, value);
			}
		}

		public virtual string s_Name
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Name) ? string.Empty : base.GetstringAsString(ColumnNames.Name);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Name);
				else
					this.Name = base.SetstringAsString(ColumnNames.Name, value);
			}
		}

		public virtual string s_DetailsArabic
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DetailsArabic) ? string.Empty : base.GetstringAsString(ColumnNames.DetailsArabic);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DetailsArabic);
				else
					this.DetailsArabic = base.SetstringAsString(ColumnNames.DetailsArabic, value);
			}
		}

		public virtual string s_DetailsEnglish
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.DetailsEnglish) ? string.Empty : base.GetstringAsString(ColumnNames.DetailsEnglish);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.DetailsEnglish);
				else
					this.DetailsEnglish = base.SetstringAsString(ColumnNames.DetailsEnglish, value);
			}
		}

		public virtual string s_Notes
	    {
			get
	        {
				return this.IsColumnNull(ColumnNames.Notes) ? string.Empty : base.GetstringAsString(ColumnNames.Notes);
			}
			set
	        {
				if(string.Empty == value)
					this.SetColumnNull(ColumnNames.Notes);
				else
					this.Notes = base.SetstringAsString(ColumnNames.Notes, value);
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
				
				
				public WhereParameter DepartementID
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DepartementID, Parameters.DepartementID);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Name
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter DetailsArabic
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DetailsArabic, Parameters.DetailsArabic);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter DetailsEnglish
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.DetailsEnglish, Parameters.DetailsEnglish);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}

				public WhereParameter Notes
				{
					get
					{
							WhereParameter where = new WhereParameter(ColumnNames.Notes, Parameters.Notes);
							this._clause._entity.Query.AddWhereParameter(where);
							return where;
					}
				}


				private WhereClause _clause;
			}
			#endregion
		
			public WhereParameter DepartementID
		    {
				get
		        {
					if(_DepartementID_W == null)
	        	    {
						_DepartementID_W = TearOff.DepartementID;
					}
					return _DepartementID_W;
				}
			}

			public WhereParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public WhereParameter DetailsArabic
		    {
				get
		        {
					if(_DetailsArabic_W == null)
	        	    {
						_DetailsArabic_W = TearOff.DetailsArabic;
					}
					return _DetailsArabic_W;
				}
			}

			public WhereParameter DetailsEnglish
		    {
				get
		        {
					if(_DetailsEnglish_W == null)
	        	    {
						_DetailsEnglish_W = TearOff.DetailsEnglish;
					}
					return _DetailsEnglish_W;
				}
			}

			public WhereParameter Notes
		    {
				get
		        {
					if(_Notes_W == null)
	        	    {
						_Notes_W = TearOff.Notes;
					}
					return _Notes_W;
				}
			}

			private WhereParameter _DepartementID_W = null;
			private WhereParameter _Name_W = null;
			private WhereParameter _DetailsArabic_W = null;
			private WhereParameter _DetailsEnglish_W = null;
			private WhereParameter _Notes_W = null;

			public void WhereClauseReset()
			{
				_DepartementID_W = null;
				_Name_W = null;
				_DetailsArabic_W = null;
				_DetailsEnglish_W = null;
				_Notes_W = null;

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
				
				
				public AggregateParameter DepartementID
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DepartementID, Parameters.DepartementID);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Name
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Name, Parameters.Name);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter DetailsArabic
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DetailsArabic, Parameters.DetailsArabic);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter DetailsEnglish
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.DetailsEnglish, Parameters.DetailsEnglish);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}

				public AggregateParameter Notes
				{
					get
					{
							AggregateParameter aggregate = new AggregateParameter(ColumnNames.Notes, Parameters.Notes);
							this._clause._entity.Query.AddAggregateParameter(aggregate);
							return aggregate;
					}
				}


				private AggregateClause _clause;
			}
			#endregion
		
			public AggregateParameter DepartementID
		    {
				get
		        {
					if(_DepartementID_W == null)
	        	    {
						_DepartementID_W = TearOff.DepartementID;
					}
					return _DepartementID_W;
				}
			}

			public AggregateParameter Name
		    {
				get
		        {
					if(_Name_W == null)
	        	    {
						_Name_W = TearOff.Name;
					}
					return _Name_W;
				}
			}

			public AggregateParameter DetailsArabic
		    {
				get
		        {
					if(_DetailsArabic_W == null)
	        	    {
						_DetailsArabic_W = TearOff.DetailsArabic;
					}
					return _DetailsArabic_W;
				}
			}

			public AggregateParameter DetailsEnglish
		    {
				get
		        {
					if(_DetailsEnglish_W == null)
	        	    {
						_DetailsEnglish_W = TearOff.DetailsEnglish;
					}
					return _DetailsEnglish_W;
				}
			}

			public AggregateParameter Notes
		    {
				get
		        {
					if(_Notes_W == null)
	        	    {
						_Notes_W = TearOff.Notes;
					}
					return _Notes_W;
				}
			}

			private AggregateParameter _DepartementID_W = null;
			private AggregateParameter _Name_W = null;
			private AggregateParameter _DetailsArabic_W = null;
			private AggregateParameter _DetailsEnglish_W = null;
			private AggregateParameter _Notes_W = null;

			public void AggregateClauseReset()
			{
				_DepartementID_W = null;
				_Name_W = null;
				_DetailsArabic_W = null;
				_DetailsEnglish_W = null;
				_Notes_W = null;

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
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_DepartementsInsert]";
	
			CreateParameters(cmd);
			
			SqlParameter p;
			p = cmd.Parameters[Parameters.DepartementID.ParameterName];
			p.Direction = ParameterDirection.Output;
    
			return cmd;
		}
	
		protected override IDbCommand GetUpdateCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_DepartementsUpdate]";
	
			CreateParameters(cmd);
			      
			return cmd;
		}
	
		protected override IDbCommand GetDeleteCommand()
		{
		
			SqlCommand cmd = new SqlCommand();
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.CommandText = "[" + this.SchemaStoredProcedure + "proc_DepartementsDelete]";
	
			SqlParameter p;
			p = cmd.Parameters.Add(Parameters.DepartementID);
			p.SourceColumn = ColumnNames.DepartementID;
			p.SourceVersion = DataRowVersion.Current;

  
			return cmd;
		}
		
		private IDbCommand CreateParameters(SqlCommand cmd)
		{
			SqlParameter p;
		
			p = cmd.Parameters.Add(Parameters.DepartementID);
			p.SourceColumn = ColumnNames.DepartementID;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Name);
			p.SourceColumn = ColumnNames.Name;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.DetailsArabic);
			p.SourceColumn = ColumnNames.DetailsArabic;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.DetailsEnglish);
			p.SourceColumn = ColumnNames.DetailsEnglish;
			p.SourceVersion = DataRowVersion.Current;

			p = cmd.Parameters.Add(Parameters.Notes);
			p.SourceColumn = ColumnNames.Notes;
			p.SourceVersion = DataRowVersion.Current;


			return cmd;
		}
	}
}
