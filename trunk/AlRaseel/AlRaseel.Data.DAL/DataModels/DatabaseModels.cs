

// This file was automatically generated.
// Do not make changes directly to this file - edit the template instead.
// 
// The following connection settings were used to generate this file
// 
//     Configuration file:     "AlRaseel.Web.UI\Web.config"
//     Connection String Name: "DBDataContext"
//     Connection String:      "Data Source=.;Initial Catalog=DBAlraseel;Persist Security Info=True;User ID=sa;Password=sql2012"

// ReSharper disable RedundantUsingDirective
// ReSharper disable DoNotCallOverridableMethodsInConstructor
// ReSharper disable InconsistentNaming
// ReSharper disable PartialTypeWithSinglePart
// ReSharper disable PartialMethodWithSinglePart
// ReSharper disable RedundantNameQualifier

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;
//using DatabaseGeneratedOption = System.ComponentModel.DataAnnotations.DatabaseGeneratedOption;

namespace Data.DataModels
{
    // ************************************************************************
    // Unit of work
    public interface IDBDataContext : IDisposable
    {
        IDbSet<Admin> Admins { get; set; } // Admins
        IDbSet<AlbumImage> AlbumImages { get; set; } // AlbumImages
        IDbSet<Contact> Contacts { get; set; } // Contacts
        IDbSet<Language> Languages { get; set; } // Languages
        IDbSet<Page> Pages { get; set; } // Pages
        IDbSet<PageSection> PageSections { get; set; } // PageSections
        IDbSet<Product> Products { get; set; } // Products
        IDbSet<ProductAlbum> ProductAlbums { get; set; } // ProductAlbums
        IDbSet<ProductImage> ProductImages { get; set; } // ProductImages
        IDbSet<SocialLink> SocialLinks { get; set; } // SocialLinks
        IDbSet<SocialLinkType> SocialLinkTypes { get; set; } // SocialLinkType
        IDbSet<Sysdiagram> Sysdiagrams { get; set; } // sysdiagrams

        int SaveChanges();
    }

    // ************************************************************************
    // Database context
    public class DBDataContext : DbContext, IDBDataContext
    {
        public IDbSet<Admin> Admins { get; set; } // Admins
        public IDbSet<AlbumImage> AlbumImages { get; set; } // AlbumImages
        public IDbSet<Contact> Contacts { get; set; } // Contacts
        public IDbSet<Language> Languages { get; set; } // Languages
        public IDbSet<Page> Pages { get; set; } // Pages
        public IDbSet<PageSection> PageSections { get; set; } // PageSections
        public IDbSet<Product> Products { get; set; } // Products
        public IDbSet<ProductAlbum> ProductAlbums { get; set; } // ProductAlbums
        public IDbSet<ProductImage> ProductImages { get; set; } // ProductImages
        public IDbSet<SocialLink> SocialLinks { get; set; } // SocialLinks
        public IDbSet<SocialLinkType> SocialLinkTypes { get; set; } // SocialLinkType
        public IDbSet<Sysdiagram> Sysdiagrams { get; set; } // sysdiagrams

        static DBDataContext()
        {
            Database.SetInitializer<DBDataContext>(null);
        }

        public DBDataContext()
            : base("Name=DBDataContext")
        {
        }

        public DBDataContext(string connectionString) : base(connectionString)
        {
        }

        public DBDataContext(string connectionString, System.Data.Entity.Infrastructure.DbCompiledModel model) : base(connectionString, model)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Configurations.Add(new AdminConfiguration());
            modelBuilder.Configurations.Add(new AlbumImageConfiguration());
            modelBuilder.Configurations.Add(new ContactConfiguration());
            modelBuilder.Configurations.Add(new LanguageConfiguration());
            modelBuilder.Configurations.Add(new PageConfiguration());
            modelBuilder.Configurations.Add(new PageSectionConfiguration());
            modelBuilder.Configurations.Add(new ProductConfiguration());
            modelBuilder.Configurations.Add(new ProductAlbumConfiguration());
            modelBuilder.Configurations.Add(new ProductImageConfiguration());
            modelBuilder.Configurations.Add(new SocialLinkConfiguration());
            modelBuilder.Configurations.Add(new SocialLinkTypeConfiguration());
            modelBuilder.Configurations.Add(new SysdiagramConfiguration());
        }

        public static DbModelBuilder CreateModel(DbModelBuilder modelBuilder, string schema)
        {
            modelBuilder.Configurations.Add(new AdminConfiguration(schema));
            modelBuilder.Configurations.Add(new AlbumImageConfiguration(schema));
            modelBuilder.Configurations.Add(new ContactConfiguration(schema));
            modelBuilder.Configurations.Add(new LanguageConfiguration(schema));
            modelBuilder.Configurations.Add(new PageConfiguration(schema));
            modelBuilder.Configurations.Add(new PageSectionConfiguration(schema));
            modelBuilder.Configurations.Add(new ProductConfiguration(schema));
            modelBuilder.Configurations.Add(new ProductAlbumConfiguration(schema));
            modelBuilder.Configurations.Add(new ProductImageConfiguration(schema));
            modelBuilder.Configurations.Add(new SocialLinkConfiguration(schema));
            modelBuilder.Configurations.Add(new SocialLinkTypeConfiguration(schema));
            modelBuilder.Configurations.Add(new SysdiagramConfiguration(schema));
            return modelBuilder;
        }
    }

    // ************************************************************************
    // POCO classes

    // Admins
    public class Admin
    {
        public Guid Id { get; set; } // Id (Primary key)
        public string UserName { get; set; } // UserName
        public string LoginName { get; set; } // LoginName
        public string Password { get; set; } // Password
        public string Email { get; set; } // Email
        public string Mobile { get; set; } // Mobile
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public Admin()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // AlbumImages
    public class AlbumImage
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? LanguageId { get; set; } // LanguageId
        public Guid? ProductAlbumId { get; set; } // ProductAlbumId
        public string ImageFile { get; set; } // ImageFile
        public string Title { get; set; } // Title
        public string Description { get; set; } // Description
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public AlbumImage()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // Contacts
    public class Contact
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? LanguageId { get; set; } // LanguageId
        public string Title { get; set; } // Title
        public string Address { get; set; } // Address
        public string Phone { get; set; } // Phone
        public string Fax { get; set; } // Fax
        public string Mobile { get; set; } // Mobile
        public string Email { get; set; } // Email
        public string WorkHours { get; set; } // WorkHours
        public string GoogleMap { get; set; } // GoogleMap
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public Contact()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // Languages
    public class Language
    {
        public Guid Id { get; set; } // Id (Primary key)
        public string Name { get; set; } // Name
        public bool? IsDefault { get; set; } // IsDefault
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public Language()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // Pages
    public class Page
    {
        public Guid Id { get; set; } // Id (Primary key)
        public string PageName { get; set; } // PageName
        public bool? IsDefault { get; set; } // IsDefault
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public Page()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // PageSections
    public class PageSection
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? PageId { get; set; } // PageId
        public Guid? LanguageId { get; set; } // LanguageId
        public string SectionTitle { get; set; } // SectionTitle
        public string SectionContent { get; set; } // SectionContent
        public string ImageFile { get; set; } // ImageFile
        public string VideoUrl { get; set; } // VideoURL
        public bool? IsDefault { get; set; } // IsDefault
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public PageSection()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // Products
    public class Product
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? LanguageId { get; set; } // LanguageId
        public string ProductTitle { get; set; } // ProductTitle
        public string ImageFile { get; set; } // ImageFile
        public string ShortDescription { get; set; } // ShortDescription
        public string FullDescription { get; set; } // FullDescription
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public Product()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // ProductAlbums
    public class ProductAlbum
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? ProductId { get; set; } // ProductId
        public Guid? LanguageId { get; set; } // LanguageId
        public string Title { get; set; } // Title
        public string AlbumDescription { get; set; } // AlbumDescription
        public string ImageFile { get; set; } // ImageFile
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public ProductAlbum()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // ProductImages
    public class ProductImage
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? LanguageId { get; set; } // LanguageId
        public Guid? ProductId { get; set; } // ProductId
        public string ImageFile { get; set; } // ImageFile
        public string Title { get; set; } // Title
        public string Description { get; set; } // Description
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public ProductImage()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // SocialLinks
    public class SocialLink
    {
        public Guid Id { get; set; } // Id (Primary key)
        public Guid? SocialLinkTypeId { get; set; } // SocialLinkTypeId
        public string SocialLinkTitle { get; set; } // SocialLinkTitle
        public string SocialLinkUrl { get; set; } // SocialLinkURL
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public SocialLink()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // SocialLinkType
    public class SocialLinkType
    {
        public Guid Id { get; set; } // Id (Primary key)
        public string SocialLinkType_ { get; set; } // SocialLinkType
        public DateTime? CreatedOn { get; set; } // CreatedOn
        public Guid? CreatedBy { get; set; } // CreatedBy
        public DateTime? ModifiedOn { get; set; } // ModifiedOn
        public Guid? ModifiedBy { get; set; } // ModifiedBy
        public bool? Active { get; set; } // Active

        public SocialLinkType()
        {
            CreatedOn = System.DateTime.Now;
        }
    }

    // sysdiagrams
    public class Sysdiagram
    {
        public string Name { get; set; } // name
        public int PrincipalId { get; set; } // principal_id
        public int DiagramId { get; set; } // diagram_id (Primary key)
        public int? Version { get; set; } // version
        public byte[] Definition { get; set; } // definition
    }


    // ************************************************************************
    // POCO Configuration

    // Admins
    internal class AdminConfiguration : EntityTypeConfiguration<Admin>
    {
        public AdminConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".Admins");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.UserName).HasColumnName("UserName").IsOptional().HasMaxLength(150);
            Property(x => x.LoginName).HasColumnName("LoginName").IsOptional().HasMaxLength(150);
            Property(x => x.Password).HasColumnName("Password").IsOptional().HasMaxLength(150);
            Property(x => x.Email).HasColumnName("Email").IsOptional().HasMaxLength(150);
            Property(x => x.Mobile).HasColumnName("Mobile").IsOptional().HasMaxLength(30);
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // AlbumImages
    internal class AlbumImageConfiguration : EntityTypeConfiguration<AlbumImage>
    {
        public AlbumImageConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".AlbumImages");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.ProductAlbumId).HasColumnName("ProductAlbumId").IsOptional();
            Property(x => x.ImageFile).HasColumnName("ImageFile").IsOptional().HasMaxLength(100);
            Property(x => x.Title).HasColumnName("Title").IsOptional().HasMaxLength(100);
            Property(x => x.Description).HasColumnName("Description").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // Contacts
    internal class ContactConfiguration : EntityTypeConfiguration<Contact>
    {
        public ContactConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".Contacts");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.Title).HasColumnName("Title").IsOptional().HasMaxLength(100);
            Property(x => x.Address).HasColumnName("Address").IsOptional();
            Property(x => x.Phone).HasColumnName("Phone").IsOptional().HasMaxLength(30);
            Property(x => x.Fax).HasColumnName("Fax").IsOptional().HasMaxLength(30);
            Property(x => x.Mobile).HasColumnName("Mobile").IsOptional().HasMaxLength(30);
            Property(x => x.Email).HasColumnName("Email").IsOptional().HasMaxLength(150);
            Property(x => x.WorkHours).HasColumnName("WorkHours").IsOptional().HasMaxLength(50);
            Property(x => x.GoogleMap).HasColumnName("GoogleMap").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // Languages
    internal class LanguageConfiguration : EntityTypeConfiguration<Language>
    {
        public LanguageConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".Languages");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.Name).HasColumnName("Name").IsOptional().HasMaxLength(20);
            Property(x => x.IsDefault).HasColumnName("IsDefault").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // Pages
    internal class PageConfiguration : EntityTypeConfiguration<Page>
    {
        public PageConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".Pages");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.PageName).HasColumnName("PageName").IsOptional().HasMaxLength(25);
            Property(x => x.IsDefault).HasColumnName("IsDefault").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // PageSections
    internal class PageSectionConfiguration : EntityTypeConfiguration<PageSection>
    {
        public PageSectionConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".PageSections");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.PageId).HasColumnName("PageId").IsOptional();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.SectionTitle).HasColumnName("SectionTitle").IsOptional().HasMaxLength(150);
            Property(x => x.SectionContent).HasColumnName("SectionContent").IsOptional();
            Property(x => x.ImageFile).HasColumnName("ImageFile").IsOptional().HasMaxLength(100);
            Property(x => x.VideoUrl).HasColumnName("VideoURL").IsOptional();
            Property(x => x.IsDefault).HasColumnName("IsDefault").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // Products
    internal class ProductConfiguration : EntityTypeConfiguration<Product>
    {
        public ProductConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".Products");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.ProductTitle).HasColumnName("ProductTitle").IsOptional().HasMaxLength(50);
            Property(x => x.ImageFile).HasColumnName("ImageFile").IsOptional().HasMaxLength(100);
            Property(x => x.ShortDescription).HasColumnName("ShortDescription").IsOptional().HasMaxLength(150);
            Property(x => x.FullDescription).HasColumnName("FullDescription").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // ProductAlbums
    internal class ProductAlbumConfiguration : EntityTypeConfiguration<ProductAlbum>
    {
        public ProductAlbumConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".ProductAlbums");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.ProductId).HasColumnName("ProductId").IsOptional();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.Title).HasColumnName("Title").IsOptional().HasMaxLength(100);
            Property(x => x.AlbumDescription).HasColumnName("AlbumDescription").IsOptional();
            Property(x => x.ImageFile).HasColumnName("ImageFile").IsOptional().HasMaxLength(100);
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // ProductImages
    internal class ProductImageConfiguration : EntityTypeConfiguration<ProductImage>
    {
        public ProductImageConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".ProductImages");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.LanguageId).HasColumnName("LanguageId").IsOptional();
            Property(x => x.ProductId).HasColumnName("ProductId").IsOptional();
            Property(x => x.ImageFile).HasColumnName("ImageFile").IsOptional().HasMaxLength(100);
            Property(x => x.Title).HasColumnName("Title").IsOptional().HasMaxLength(100);
            Property(x => x.Description).HasColumnName("Description").IsOptional();
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // SocialLinks
    internal class SocialLinkConfiguration : EntityTypeConfiguration<SocialLink>
    {
        public SocialLinkConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".SocialLinks");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.SocialLinkTypeId).HasColumnName("SocialLinkTypeId").IsOptional();
            Property(x => x.SocialLinkTitle).HasColumnName("SocialLinkTitle").IsOptional().HasMaxLength(25);
            Property(x => x.SocialLinkUrl).HasColumnName("SocialLinkURL").IsOptional().HasMaxLength(250);
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // SocialLinkType
    internal class SocialLinkTypeConfiguration : EntityTypeConfiguration<SocialLinkType>
    {
        public SocialLinkTypeConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".SocialLinkType");
            HasKey(x => x.Id);

            Property(x => x.Id).HasColumnName("Id").IsRequired();
            Property(x => x.SocialLinkType_).HasColumnName("SocialLinkType").IsOptional().HasMaxLength(25);
            Property(x => x.CreatedOn).HasColumnName("CreatedOn").IsOptional();
            Property(x => x.CreatedBy).HasColumnName("CreatedBy").IsOptional();
            Property(x => x.ModifiedOn).HasColumnName("ModifiedOn").IsOptional();
            Property(x => x.ModifiedBy).HasColumnName("ModifiedBy").IsOptional();
            Property(x => x.Active).HasColumnName("Active").IsOptional();
        }
    }

    // sysdiagrams
    internal class SysdiagramConfiguration : EntityTypeConfiguration<Sysdiagram>
    {
        public SysdiagramConfiguration(string schema = "dbo")
        {
            ToTable(schema + ".sysdiagrams");
            HasKey(x => x.DiagramId);

            Property(x => x.Name).HasColumnName("name").IsRequired().HasMaxLength(128);
            Property(x => x.PrincipalId).HasColumnName("principal_id").IsRequired();
            Property(x => x.DiagramId).HasColumnName("diagram_id").IsRequired().HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            Property(x => x.Version).HasColumnName("version").IsOptional();
            Property(x => x.Definition).HasColumnName("definition").IsOptional();
        }
    }

}

