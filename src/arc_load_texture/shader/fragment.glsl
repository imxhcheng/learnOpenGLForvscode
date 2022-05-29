#version 330 core
in vec2 TexCoord;
in vec3 ourColor;

out vec4 FragColor;

uniform sampler2D texture1;
void main() 
{
  // vec3 rgb;
  // rgb.x = texture(texture1, TexCoord).r;
  // rgb.y = rgb.x;
  // rgb.z = rgb.x;
  // FragColor = vec4(rgb, 1);
  FragColor = texture(texture1, TexCoord);
}
