// Import necessary namespaces for JWT authentication and token validation
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

// Create a builder for the web application, which sets up configuration and services
var builder = WebApplication.CreateBuilder(args);

// Retrieve the configuration service to access app settings
var configuration = builder.Services.BuildServiceProvider().GetRequiredService<IConfiguration>();

// Retrieve JWT settings (Issuer, Audience, and Secret) from the configuration
string JwtIssure = configuration["Jwt:Issuer"];
string JwtAudience = configuration["Jwt:Audience"];
string JwtKey = configuration["Jwt:Secret"];

// Add authentication services to the container and configure JWT Bearer authentication
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        // Configure token validation parameters for JWT authentication
        options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
        {
            ValidateIssuer = true, // Validate the issuer of the token
            ValidateAudience = true, // Validate the audience of the token
            ValidateLifetime = true, // Validate the token's expiration time
            ValidateIssuerSigningKey = true, // Validate the signing key used to sign the token
            ValidIssuer = JwtIssure, // Specify the valid issuer
            ValidAudience = JwtAudience, // Specify the valid audience
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtKey)) // Set the signing key using the secret
        };
    });

// Add services to the container, including controllers for handling HTTP requests
builder.Services.AddControllers();

// Configure Swagger/OpenAPI to generate API documentation
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Configure CORS (Cross-Origin Resource Sharing) policy to allow requests from any origin, header, and method
builder.Services.AddCors(p => p.AddPolicy("corspolicy", build =>
    build.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod()
));

// Build the application, which finalizes the configuration
var app = builder.Build();

// Configure the HTTP request pipeline, which defines how requests are processed

// Enable Swagger and Swagger UI only in the development environment
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Use HTTPS redirection to ensure all requests are redirected to HTTPS
app.UseHttpsRedirection();

// Apply the CORS policy defined earlier
app.UseCors("corspolicy");

// Enable authorization middleware to enforce authorization policies
app.UseAuthorization();

// Map controller routes to endpoints, allowing the app to respond to controller actions
app.MapControllers();

// Run the application, starting the web server
app.Run();
