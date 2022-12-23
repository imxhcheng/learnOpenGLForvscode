#version 330 core
out vec4 FragColor;

//材质
struct Material{
  sampler2D diffuse;
  sampler2D specular;
  float shininess;
};


//光照属性
struct Light{
  vec3 position;

  vec3 ambient;
  vec3 diffuse;
  vec3 specular;
};

in vec3 Normal;
in vec3 FragPos;
in vec2 TexCoords;

uniform Material material;
uniform Light light;
uniform vec3 viewPos;


void main()
 {

  // 环境光照 == 漫反射光照
  vec3 ambient = texture(material.diffuse,TexCoords).rgb* light.ambient;

  // 漫反射光照
  vec3 norm = normalize(Normal);
  vec3 lightDir = normalize(light.position - FragPos);
  float diff = max(dot(norm,lightDir),0.0);
  vec3 diffuse = diff*texture(material.diffuse,TexCoords).rgb*light.diffuse;

  // 镜面反射关照
  vec3 viewDir = normalize(viewPos-FragPos);
  vec3 reflectDir = reflect(-lightDir,norm);
  float spec = pow(max(dot(viewDir,reflectDir),0.0),material.shininess);
  vec3 specular = light.specular * spec * texture(material.specular, TexCoords).rgb;

  vec3 result = (ambient + diffuse + specular);
  FragColor = vec4(result,1.0);
}