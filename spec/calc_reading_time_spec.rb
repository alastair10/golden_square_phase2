require 'calc_reading_time'

RSpec.describe "calculates reading time" do
  context "given str of 0 words" do
    it "returns 0" do
      result = calc_reading_time("")
      expect(result).to eq 0
    end
  end

  context "given 200 words" do
    it "returns 1" do
      result = calc_reading_time("Scelerisque natoque viverra. Mattis. Semper elementum habitant gravida facilisis. Purus euismod class Fames placerat ligula. Sem. Habitasse ligula ultricies justo. Rutrum convallis tortor justo sapien conubia natoque sagittis. Sociosqu, risus natoque mollis posuere cum torquent mollis risus dolor odio. Natoque, placerat. Aptent nec duis ornare penatibus varius, nam lacus vestibulum molestie sodales platea phasellus amet vulputate. A, integer justo Fames.

      Volutpat quam sed aenean. Ipsum vel duis dignissim rhoncus morbi tempor. Ullamcorper vestibulum donec vulputate dictumst at odio morbi tempor semper pretium suscipit, fermentum quis nulla feugiat conubia molestie litora leo nulla lacinia vulputate id. Consequat sodales vestibulum. Mi, imperdiet nulla sollicitudin semper, rhoncus consequat. Semper bibendum viverra mattis cum elit torquent faucibus hymenaeos metus, mattis. At facilisi ligula, consequat. Rutrum, ipsum nisl tellus primis porttitor fermentum felis. Porttitor lacinia. Donec ante ad, mattis fames facilisi nisi ipsum dignissim taciti fames morbi nullam cum ridiculus senectus.
      
      Neque nullam lobortis Odio fusce sapien eros fusce curae; arcu sociosqu. Class mi pulvinar consectetuer justo viverra ante Adipiscing nunc nunc sodales. Placerat cras enim purus diam sociis potenti non dui turpis. Lacinia hymenaeos tristique potenti cras curabitur ligula. Semper penatibus, dis sem elementum vitae montes, ultrices convallis pharetra. Lacus conubia vulputate eu faucibus.")
      expect(result).to eq 1
    end

    context "given 100 words" do
      it "returns 0.5" do
        result = calc_reading_time("At, inceptos sollicitudin sed porta nunc fames. Rhoncus lectus lacus. Inceptos. A tempor erat litora nunc justo consectetuer taciti porta quis amet imperdiet metus aenean dignissim nam.

        Pellentesque fames justo morbi varius. Odio nulla dis dui. Vel Posuere. Tempus Luctus tortor magna varius, ultrices sapien per varius. Risus aliquet lorem at accumsan, suscipit mauris pharetra. Erat, pulvinar dapibus in, lacinia eget, dictumst fringilla metus lorem. Convallis ad. Blandit. Dapibus ad vehicula sed egestas aliquam mauris.
        
        Purus ac sociis rhoncus congue congue etiam mattis pulvinar. Sit odio etiam ullamcorper proin curae; commodo nostra mus aliquet est blandit eleifend. Curabitur sollicitudin justo.")
        expect(result).to eq 0.5
      end
    end

  end
end